//
// This file is part of Nabigeta
//
// Created by JC on 15/03/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

var ViewControllerPresentationHandler = "ViewControllerPresentationHandler"
var tokenPrepareForSegue: dispatch_once_t = 0

class PresentationHandler {
    let willShow: PresentationWillShowHandler?

    init(willShow: PresentationWillShowHandler?) {
        self.willShow = willShow
    }
}

extension UIViewController {
    var presentationHandler: PresentationHandler? {
        get { return objc_getAssociatedObject(self, &ViewControllerPresentationHandler) as? PresentationHandler }
        set { objc_setAssociatedObject(self, &ViewControllerPresentationHandler, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    public override class func initialize() {
        if (!(object_getClassName(self) == object_getClassName(UIViewController.self))) {
            return
        }

        dispatch_once(&tokenPrepareForSegue) {
            let originalMeth = class_getInstanceMethod(self, "prepareForSegue:sender:")
            let swizzledMeth = class_getInstanceMethod(self, "nabigeta_prepareForSegue:sender:")

            method_exchangeImplementations(originalMeth, swizzledMeth)
        }
    }

    public func nabigeta_prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject) {
        // FIXME use as! once we unsupport Swift 1.1
        let destination = segue.destinationViewController as? UIViewController
        let navContext = self.navigationContext

        self.nabigeta_prepareForSegue(segue, sender: sender)
        self.presentationHandler?.willShow?(destination!, navContext?.context)
    }
}
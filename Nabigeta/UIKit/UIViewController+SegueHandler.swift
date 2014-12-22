//
// This file is part of Nabigeta
//
// Created by JC on 22/12/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

var UIViewControllerSegueDelegate = "UIViewControllerSegueDelegateKey"

extension UIViewController {
    var segueHandler: SegueNavigationHandler? {
        get { return objc_getAssociatedObject(self, &UIViewControllerSegueDelegate) as? SegueNavigationHandler }
        set { objc_setAssociatedObject(self, &UIViewControllerSegueDelegate, newValue, UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC)) }
    }

    public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.segueHandler?.prepareForSegue(segue, sender: sender)
    }
}
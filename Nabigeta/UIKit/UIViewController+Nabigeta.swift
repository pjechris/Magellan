//
// This file is part of Nabigeta
//
// Created by JC on 20/01/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

extension UIViewController {
    struct Keys {
        static var ShownContext = "ShownContextAttr"
        static var ShowingContext = "ShowingContextAttr"
        static var Navigation = "NavigationAttr"
    }

    /// The `PresentingContext` that is shown from this view controller
    var shownPresentingContext: PresentingContext? {
        get { return objc_getAssociatedObject(self, &Keys.ShownContext) as? PresentingContext }
        set { objc_setAssociatedObject(self, &Keys.ShownContext, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    /// The `PresentingContext` that is showing this view controller
    var showingPresentingContext: PresentingContext? {
        get { return objc_getAssociatedObject(self, &Keys.ShowingContext) as? PresentingContext }
        set { objc_setAssociatedObject(self, &Keys.ShowingContext, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    /// navigation used to navigate from/to this viewcontroller
    public internal(set) weak var navigation: Navigation? {
        get { return objc_getAssociatedObject(self, &Keys.Navigation) as? Navigation }
        set { objc_setAssociatedObject(self, &Keys.Navigation, newValue, .OBJC_ASSOCIATION_ASSIGN) }
    }
}

extension Navigable where Self : UIViewController {

    public func navigate(to context: Any, control: UIControl? = nil) -> PresentingContext? {
        return self.navigation?.navigate(to: context, sender: self, control: control)
    }

    public func navigateBack() {
        self.navigation?.navigateBack(to: self)
    }

    public func navigationTerminated(status status: PresentingContext.TerminateStatus = .Completed) {
        self.navigation?.navigateBack(from: self, status: status)
    }
}
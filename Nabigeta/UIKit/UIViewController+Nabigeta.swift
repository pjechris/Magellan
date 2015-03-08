//
// This file is part of Nabigeta
//
// Created by JC on 20/01/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

var NabigetaViewControllerNavigationContext = "NabigetaViewControllerNavigationContext"

extension UIViewController {
    var navigationContext: NavigationContext? {
        get { return objc_getAssociatedObject(self, &NabigetaViewControllerNavigationContext) as? NavigationContext }
        set { objc_setAssociatedObject(self, &NabigetaViewControllerNavigationContext, newValue, UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC)) }
    }

    /// For internal use only
    /// Used by a modal UIBarButtonItem to inform presentingViewController to close its modal 
    func dismissModalCallback() {
        self.navigationContext?.route.presentation.strategy().dismiss(self)
    }
}
//
// This file is part of Nabigeta
//
// Created by JC on 20/01/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

var UIViewControllerRoute = "UIViewControllerRouteKey"

extension UIViewController {
    var route: Routable? {
        get { return objc_getAssociatedObject(self, &UIViewControllerRoute) as? Routable }
        set { objc_setAssociatedObject(self, &UIViewControllerRoute, newValue, UInt(OBJC_ASSOCIATION_RETAIN_NONATOMIC)) }
    }
}
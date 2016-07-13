//
// This file is part of Nabigeta
//
// Created by JC on 20/01/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

var PresentingContextAttr = "PresentingContextAttr"

extension UIViewController {
    var presentingContext: PresentingContext? {
        get { return objc_getAssociatedObject(self, &PresentingContextAttr) as? PresentingContext }
        set { objc_setAssociatedObject(self, &PresentingContextAttr, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
}
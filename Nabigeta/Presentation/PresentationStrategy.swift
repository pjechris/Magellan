//
// This file is part of Nabigeta
//
// Created by JC on 06/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

public typealias PresentationWillShowHandler = (UIViewController, Any?) -> Void

public protocol PresentationStrategy {
    func show(navigationContext: NavigationContext, willShow: PresentationWillShowHandler?)

    func dismiss(sender: UIViewController)
}
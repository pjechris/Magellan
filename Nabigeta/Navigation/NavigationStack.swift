//
// This file is part of Nabigeta
//
// Created by JC on 22/12/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

/**
 * Represent a navigation stack. You're either
 * - on the current stack
 * - on a new stack, possibly displayed with a custom UiNavigationController instance
 */
public enum NavigationStack {
    case Current
    case Custom(UINavigationController?)

    public func isNewStack() -> Bool {
        switch self {
        case .Custom(_):
            return true
        default:
            return false
        }
    }
}
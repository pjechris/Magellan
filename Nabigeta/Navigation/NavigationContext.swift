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
 * Provide contextual information for a navigation between two view controllers.
 *
 * During navigation this object is automatically created and passed to navigation strategies.
 * You should not create any instance of this object by your own.
 *
 * Think about this object as a equivalent to UIViewControllerContextTransitioning but for navigation
 */
public class NavigationContext : NSObject {
    /// the view controller requiring navigation
    public let sourceViewController: UIViewController
    /// the destination controller. This value is unknown until updateContext is called
    public private(set) var destinationViewController: UIViewController?
    /// The navigation controller used to stack the destination controller
    /// This value might change when updateContext has been called
    public private(set) var stackViewController: UINavigationController?

    public var onUpdate: ((UIViewController) -> ())?

    public init(source: UIViewController, defaultStack: UINavigationController) {
        self.sourceViewController = source
        self.stackViewController = defaultStack;
    }

    /**
    * @param destination the destination view controller
    * @param stack the navigation controller on which destination has been stacked
    */
    public func updateContext(destination: UIViewController, stack: UINavigationController?) {
        self.destinationViewController = destination
        self.stackViewController = stack
        self.onUpdate?(destination)
    }
}
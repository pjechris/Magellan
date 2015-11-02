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
public class NavigationContext: NSObject {
    /// the view controller requiring navigation
    unowned public let sourceViewController: UIViewController

    public let route: Routable

    public let context: AnyObject?

    public let presenter: PresentationStrategy

    internal let transition: Transition

    public init(source: UIViewController, route: Routable, context: AnyObject?, transition: Transition?) {
        self.sourceViewController = source
        self.route = route
        self.context = context
        self.transition = transition ?? Transition(presentation: route.presentation, trait: nil)
        self.presenter = self.transition.presentation.presenter()
    }
}
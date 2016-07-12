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
public class NavigationContext {
    /// the view controller requiring navigation
    unowned public let sourceViewController: UIViewController

    public let route: Route

    public let context: Any

    public let touchedControl: UIControl?

    public convenience init(context: Any, route: Route, source: UIControl) {
        var controller: UIViewController! = nil
        var responder: UIResponder? = source.nextResponder()

        while responder != nil {
            if ((responder as? UIViewController) != nil) {
                controller = responder as! UIViewController
            }

            responder = responder?.nextResponder()
        }

        self.init(context: context, route: route, source: controller, control: source)
    }

    public convenience init(context: Any, route: Route, source: UIViewController) {
        self.init(context: context, route: route, source: source, control: nil)
    }

    public init(context: Any, route: Route, source: UIViewController, control: UIControl?) {
        self.sourceViewController = source
        self.route = route
        self.context = context
        self.touchedControl = control
    }
}
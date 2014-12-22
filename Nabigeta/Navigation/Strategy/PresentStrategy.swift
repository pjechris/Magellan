//
// This file is part of Nabigeta
//
// Created by JC on 22/12/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

public class PresentStrategy : NavigationStrategy {
    private let route: Route

    public init(route: Route) {
        self.route = route
    }

    public func navigate(navigationContext: NavigationContext) {
        var destinationController = self.route.destination()
        var stackController: UINavigationController!

        switch(self.route.stack) {
        case .Custom(let customStackViewController) where (customStackViewController != nil):
            stackController = customStackViewController
        default:
            stackController = navigationContext.supplyStack()
        }

        stackController.pushViewController(destinationController, animated: false)
        navigationContext.updateContext(destinationController)
        navigationContext.sourceViewController.presentViewController(stackController, animated: true, completion: nil)
    }

    public func navigateBack(sender: UIViewController) {
        sender.dismissViewControllerAnimated(true, completion: nil)
    }
}
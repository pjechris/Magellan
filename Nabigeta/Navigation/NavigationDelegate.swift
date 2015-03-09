//
// This file is part of Nabigeta
//
// Created by JC on 08/03/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

public class NavigationDelegate : NSObject, UINavigationControllerDelegate {
    public var navigationControllerDelegate: UINavigationControllerDelegate?

    public var willNavigate: ((UIViewController, AnyObject?) -> Void)?
    public var didNavigate: ((UIViewController, AnyObject?) -> Void)?

    private func findContext(navigationController: UINavigationController) -> NavigationContext? {
        var context: NavigationContext?
        let controllers = navigationController.viewControllers.reverse() as Array<UIViewController>

        for controller in controllers {
            if let context = controller.navigationContext {
                return context
            }
        }

        return context
    }

    public func navigationController(navigationController: UINavigationController,
        willShowViewController viewController: UIViewController,
        animated: Bool) {
            let navContext = self.findContext(navigationController)

            self.willNavigate?(viewController, navContext?.context)
            self.navigationControllerDelegate?.navigationController?(navigationController, willShowViewController: viewController, animated: animated)
    }

    public func navigationController(navigationController: UINavigationController,
        didShowViewController viewController: UIViewController,
        animated: Bool) {
            let navContext = self.findContext(navigationController)

            // restore delegate
            navigationController.delegate = self.navigationControllerDelegate

            self.didNavigate?(viewController, navContext?.context)
            self.navigationControllerDelegate?.navigationController?(navigationController, didShowViewController: viewController, animated: animated)
    }

    // TODO implement all the other methods
}
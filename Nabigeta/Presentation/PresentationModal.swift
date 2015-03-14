//
// This file is part of Nabigeta
//
// Created by JC on 22/12/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

public class PresentationModal : PresentationStrategy {

    public func show(navigationContext: NavigationContext) {
        var destinationController = navigationContext.route.destination()
        var stackController: UINavigationController! = UINavigationController()

        stackController.pushViewController(destinationController, animated: false)
        self.buildAndAddDismissButton(navigationContext.sourceViewController, destinationController)
        navigationContext.sourceViewController.presentViewController(stackController, animated: true, completion: nil)
    }

    public func dismiss(sender: UIViewController) {
        sender.dismissViewControllerAnimated(true, completion: nil)
    }

    /// Build and add a dismiss/cancel button to the context destination controller if needed
    /// It is added when:
    /// - destination controller has no leftBarButtonItem setted on its navigationItem
    private func buildAndAddDismissButton(source: UIViewController, _ destination: UIViewController) {
        let dismissBtn = UIBarButtonItem(barButtonSystemItem: .Cancel, target: source, action: "dismissModalCallback")

        if (destination.navigationItem.leftBarButtonItem == nil) {
            destination.navigationItem.leftBarButtonItem = dismissBtn
        }
    }
}
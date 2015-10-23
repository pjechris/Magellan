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
    private let presentation: UIModalPresentationStyle?
    private let transition: UIModalTransitionStyle?

    init(presentation: UIModalPresentationStyle? = nil, transition: UIModalTransitionStyle? = nil) {
        self.presentation = presentation
        self.transition = transition
    }

    public func show(navigationContext: NavigationContext, willShow: PresentationWillShowHandler?) {
        let destinationController = navigationContext.route.destination.init()
        let stackController: UINavigationController = UINavigationController()

        if (self.presentation != nil) {
            stackController.modalPresentationStyle = self.presentation!
        }

        if (self.transition != nil) {
            stackController.modalTransitionStyle = self.transition!
        }

        stackController.pushViewController(destinationController, animated: false)
        self.buildAndAddDismissButton(navigationContext.sourceViewController, destinationController)

        willShow?(destinationController, navigationContext.context)
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
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

    public init(presentation: UIModalPresentationStyle? = nil, transition: UIModalTransitionStyle? = nil) {
        self.presentation = presentation
        self.transition = transition
    }

    public func show(navigationContext: NavigationContext) {
        let destinationController = navigationContext.destinationViewController
        let stackController: UINavigationController = UINavigationController()

        if (self.presentation != nil) {
            stackController.modalPresentationStyle = self.presentation!
        }

        if (self.transition != nil) {
            stackController.modalTransitionStyle = self.transition!
        }

        stackController.pushViewController(destinationController, animated: false)
        navigationContext.sourceViewController.presentViewController(stackController, animated: true, completion: nil)
    }

    public func dismiss(sender: UIViewController) {
        sender.dismissViewControllerAnimated(true, completion: nil)
    }
}
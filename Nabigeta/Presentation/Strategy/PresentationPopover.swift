//
// This file is part of Nabigeta
//
// Created by JC on 12/11/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

public class PresentationPopover : PresentationStrategy {

    public func show(navigationContext: NavigationContext) {
        let destinationController = navigationContext.destinationViewController
        let stackController: UINavigationController = UINavigationController()

        stackController.modalPresentationStyle = .Popover
        stackController.pushViewController(destinationController, animated: false)
        navigationContext.sourceViewController.presentViewController(stackController, animated: true, completion: nil)

        stackController.popoverPresentationController!.sourceView = navigationContext.touchedControl
        stackController.popoverPresentationController!.sourceRect = navigationContext.touchedControl!.bounds
    }

    public func dismiss(sender: UIViewController) {
        sender.dismissViewControllerAnimated(true, completion: nil)
    }
}

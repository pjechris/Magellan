//
// This file is part of Nabigeta
//
// Created by JC on 12/11/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

open class PresentationPopover : PresentationStrategy {

    open func show(_ navigationContext: NavigationContext) {
        let destinationController = navigationContext.destinationViewController
        let stackController: UINavigationController = UINavigationController()

        stackController.modalPresentationStyle = .popover
        stackController.pushViewController(destinationController, animated: false)
        navigationContext.sourceViewController.present(stackController, animated: true, completion: nil)

        stackController.popoverPresentationController!.sourceView = navigationContext.touchedControl
        stackController.popoverPresentationController!.sourceRect = navigationContext.touchedControl!.bounds
    }

    open func dismiss(_ context: NavigationContext) {
        context.sourceViewController.dismiss(animated: true, completion: nil)
    }
}

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
    private let wrapper: () -> UINavigationController?

    convenience public init(presentation: UIModalPresentationStyle? = nil,
                            transition: UIModalTransitionStyle? = nil) {
        self.init(useWrapper: UINavigationController(), presentation: presentation, transition: transition)
    }

    public init(@autoclosure(escaping) useWrapper wrapper: () -> UINavigationController?,
                presentation: UIModalPresentationStyle? = nil,
                transition: UIModalTransitionStyle? = nil) {
        self.presentation = presentation
        self.transition = transition
        self.wrapper = wrapper
    }

    public func show(navigationContext: NavigationContext) {
        let destinationController = navigationContext.destinationViewController
        let stackController = self.wrapper()

        
        if let presentation = self.presentation {
            stackController?.modalPresentationStyle = presentation
        }

        if let transition = self.transition {
            stackController?.modalTransitionStyle = transition
        }

        stackController?.pushViewController(destinationController, animated: false)

        if let stackController = stackController {
            navigationContext.sourceViewController.presentViewController(stackController, animated: true, completion: nil)
        }
        else {
            navigationContext.sourceViewController.presentViewController(destinationController, animated: true, completion: nil)
        }
    }

    public func dismiss(context: NavigationContext) {
        context.sourceViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
//
// This file is part of Nabigeta
//
// Created by JC on 22/12/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

open class PresentationModal : PresentationStrategy {
    fileprivate let presentation: UIModalPresentationStyle?
    fileprivate let transition: UIModalTransitionStyle?
    fileprivate let wrapper: () -> UINavigationController?

    convenience public init(presentation: UIModalPresentationStyle? = nil,
                            transition: UIModalTransitionStyle? = nil) {
        self.init(useWrapper: UINavigationController(), presentation: presentation, transition: transition)
    }

    public init( useWrapper wrapper: @autoclosure @escaping () -> UINavigationController?,
                presentation: UIModalPresentationStyle? = nil,
                transition: UIModalTransitionStyle? = nil) {
        self.presentation = presentation
        self.transition = transition
        self.wrapper = wrapper
    }

    open func show(_ navigationContext: NavigationContext) {
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
            navigationContext.sourceViewController.present(stackController, animated: true, completion: nil)
        }
        else {
            navigationContext.sourceViewController.present(destinationController, animated: true, completion: nil)
        }
    }

    open func dismiss(_ context: NavigationContext) {
        context.sourceViewController.dismiss(animated: true, completion: nil)
    }
}

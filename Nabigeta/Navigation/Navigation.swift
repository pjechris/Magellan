//
// This file is part of Nabigeta
//
// Created by JC on 04/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

public class Navigation {
    public var willNavigate: (Any -> Void)? = nil
    public var router: (Any -> Route)?
    
    private let traitProvider: UITraitEnvironment

    public init(traitProvider: UITraitEnvironment) {
        self.traitProvider = traitProvider
    }

    /**
     Use `context` to navigate to a new `UIViewController`.
     @param context context to use to navigate. Will be passed to destination `UIViewController`.
     @param sender `UIViewController` making the request.
     @param control optional control from which the action was performed, like a `UIButton`.
    **/
    public func navigate(to context: Any, sender: UIViewController, control: UIControl? = nil) {
        if let route = self.router?(context) {

            let destination = route.destination(storyboard: sender.storyboard)
            let context = NavigationContext(context: context, source: sender, destination: destination, control: control)
            let presentation = route.presentation(forTrait: self.traitProvider.traitCollection)

            self.doNavigation(context: context, presentation: presentation)

            return
        }
    }

    private func doNavigation(context context: NavigationContext, presentation: PresentationStrategy) {
        self.willNavigate?(context.context)
        context.sourceViewController.presentingContext = PresentingContext(context: context, presentation: presentation)
        presentation.show(context)
        context.anyDestinationViewController.didNavigate(to: context.context)
    }

    public func navigateBack(to sender: UIViewController) {
        if let presentingContext = sender.presentingContext {
            presentingContext.presentation.dismiss(presentingContext.context)
        }
    }
}

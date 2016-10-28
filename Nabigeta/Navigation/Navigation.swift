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
    public var router: ((Any, from: UIViewController) -> Route?)? = nil
    
    private let traitProvider: UITraitEnvironment

    /**
     Init with the application root controller and a UITraitEnvironment provider
     @param root Application root view controller along its context. Will be navigated to (without animation) and initialized properly for further navigations.
     @param traitProvider Delegate providing `Navigation` with trait information. Usually an instance of `UIWindow`.
    **/
    public init<Root: UIViewController where Root: Navigable>(root:(Root, Root.ContextType), traitProvider: UITraitEnvironment) {
        self.traitProvider = traitProvider

        self.doNavigation(context: NavigationContext(context: root.1, source: root.0, destination: AnyNavigableViewController(root.0)),
                          presentation: PresentationRoot())
    }

    /**
     Use `context` to navigate to a new `UIViewController`.
     @param context context to use to navigate. Will be passed to destination `UIViewController`.
     @param sender `UIViewController` making the request.
     @param control optional control from which the action was performed, like a `UIButton`.
    **/
    public func navigate(to context: Any, sender: UIViewController, control: UIControl? = nil) -> PresentingContext? {
        if let route = self.router?(context, from: sender) {

            let destination = route.destination(storyboard: sender.storyboard)
            let context = NavigationContext(context: context, source: sender, destination: destination, control: control)
            let presentation = route.presentation(forTrait: self.traitProvider.traitCollection)

            return self.doNavigation(context: context, presentation: presentation)
        }

        return nil
    }

    private func doNavigation(context context: NavigationContext, presentation: PresentationStrategy) -> PresentingContext {
        let presentingContext = PresentingContext(context: context, presentation: presentation)

        self.willNavigate?(context.context)

        context.sourceViewController.shownPresentingContext = presentingContext
        context.destinationViewController.showingPresentingContext = presentingContext
        context.destinationViewController.navigation = self

        presentation.show(context)
        context.anyDestinationViewController.didNavigate(to: context.context)

        return presentingContext
    }

    /// Stops any running navigation initiated by `sender` and navigate back to it
    public func navigateBack(to sender: UIViewController) {
        if let presentingContext = sender.shownPresentingContext {
            presentingContext.presentation.dismiss(presentingContext.context)
        }
    }

    /// Stops navigation initiated on `destination` and navigate back to its sender
    public func navigateBack(from destination: UIViewController, status: PresentingContext.TerminateStatus = .Completed) {
        if  let presentingContext = destination.showingPresentingContext {
            presentingContext.terminate(status)
        }
    }
}

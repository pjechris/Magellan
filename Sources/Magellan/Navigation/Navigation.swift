//
// This file is part of Nabigeta
//
// Created by JC on 04/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

open class Navigation {
    public typealias Router<T> = (T, UIViewController) -> Route?

    open var willNavigate: ((Any) -> Void)? = nil
    public let router: Router<Any>
    
    fileprivate let traitProvider: UITraitEnvironment

    /**
     Init with the application root controller and a UITraitEnvironment provider
     @param root Application root view controller along its context. Will be navigated to (without animation) and initialized properly for further navigations.
     @param traitProvider Delegate providing `Navigation` with trait information. Usually an instance of `UIWindow`.
    **/
    public init<Route>(root: UIViewController, router: @escaping Router<Route>, traitProvider: UITraitEnvironment) {
        self.traitProvider = traitProvider
        self.router = { context, from in
            guard let context = context as? Route else {
                return nil
            }

            return router(context, from)
        }

        root.navigation = self
    }

    /**
     Use `context` to navigate to a new `UIViewController`.
     @param context context to use to navigate. Will be passed to destination `UIViewController`.
     @param sender `UIViewController` making the request.
     @param control optional control from which the action was performed, like a `UIButton`.
    **/
    @discardableResult
    open func navigate(to context: Any, sender: UIViewController, control: UIControl? = nil) -> PresentingContext? {
        if let route = self.router(context, sender) {

            let navigation = NavigationContext(source: sender, destination: route.destination, control: control)
            let presentation = route.presentation(self.traitProvider.traitCollection)

            return self.doNavigation(context: context, navigation: navigation, presentation: presentation)
        }

        return nil
    }

    fileprivate func doNavigation(context: Any, navigation: NavigationContext, presentation: PresentationStrategy) -> PresentingContext {
        let presentingContext = PresentingContext(context: navigation, presentation: presentation)

        self.willNavigate?(context)

        navigation.sourceViewController.shownPresentingContext = presentingContext
        navigation.destinationViewController.showingPresentingContext = presentingContext
        navigation.destinationViewController.navigation = self

        presentation.show(navigation)

        return presentingContext
    }

    /// Stops any running navigation initiated by `sender` and navigate back to it
    open func navigateBack(to sender: UIViewController) {
        if let presentingContext = sender.shownPresentingContext {
            presentingContext.presentation.dismiss(presentingContext.context)
        }
    }

    /// Stops navigation initiated on `destination` and navigate back to its sender
    open func navigateBack(from destination: UIViewController, status: PresentingContext.TerminateStatus = .completed) {
        if  let presentingContext = destination.showingPresentingContext {
            presentingContext.terminate(status)
        }
    }
}

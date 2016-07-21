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

    private let traitProvider: UITraitEnvironment
    private var router: (Any -> Route)?

    public init(traitProvider: UITraitEnvironment) {
        self.traitProvider = traitProvider
    }

    public func navigate(to context: Any, sender: UIViewController) {
        if let route = self.router?(context) {
            self.navigate(to: route, context: NavigationContext(context: context, route: route, source: sender))

            return
        }
    }

    /// This API is in Beta.
    public func navigate(to context: AnyObject, sender: UIControl) {
        if let route = self.router?(context) {
            self.navigate(to: route, context: NavigationContext(context: context, route: route, source: sender))

            return
        }
    }

    private func navigate(to route: Route, context: NavigationContext) {
        let presentation = route.presentation(forTrait: self.traitProvider.traitCollection)

        self.willNavigate?(context.context)
        context.sourceViewController.presentingContext = PresentingContext(context: context, presentation: presentation)
        presentation.show(context)
    }

    public func navigateBack(to sender: UIViewController) {
        let presentingContext = sender.presentingContext

        presentingContext?.presentation.dismiss(sender)
    }
}

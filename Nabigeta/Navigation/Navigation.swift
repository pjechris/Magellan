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

    public func navigate(name: String, context: Any, sender: UIViewController) {
        if let route = self.router?(context) {
            self.navigate(NavigationContext.init(context: context, route: route, source: sender))

            return
        }
    }

    /// This API is in Beta.
    public func navigate(name: String, context: AnyObject, sender: UIControl) {
        if let route = self.router?(context) {
            self.navigate(NavigationContext.init(context: context, route: route, source: sender))

            return
        }
    }

    private func navigate(context: NavigationContext) {
        let presentation = context.route.presentation(forTrait: self.traitProvider.traitCollection)

        context.sourceViewController.navigationContext = context
        self.willNavigate?(context.context)
        presentation.show(context)
    }

    public func navigateBack(sender: UIViewController) {
        let context = sender.navigationContext
        let presentation = context?.route.presentation(forTrait: self.traitProvider.traitCollection)

        presentation?.dismiss(sender)
    }
}

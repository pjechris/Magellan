//
// This file is part of Nabigeta
//
// Created by JC on 04/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

public struct Route {
    public let destinationType: UIViewController.Type
    public let storyboardIdentifier: String?

    public private(set) var presentation: (forTrait: UITraitCollection) -> PresentationStrategy

    let destination: (storyboard: UIStoryboard?) -> AnyNavigableViewController

    public init<Destination: UIViewController where Destination: Navigable>(_ destination: Destination.Type, storyboardIdentifier: String? = nil) {
        self.destinationType = destination
        self.storyboardIdentifier = storyboardIdentifier
        self.presentation = { _ in PresentationPush() }
        self.destination = {
            guard let storyboard = $0, let storyboardIdentifier = storyboardIdentifier else {
                return AnyNavigableViewController(destination.init())
            }

            let viewController = storyboard.instantiateViewControllerWithIdentifier(storyboardIdentifier)
            return AnyNavigableViewController(viewController as! Destination)
        }
    }

    public func present(presentation: PresentationStrategy) -> Route {
        return self.present { _ in
            presentation
        }
    }

    public func present(when presentation: (UITraitCollection) -> PresentationStrategy) -> Route {
        var route = self

        route.presentation = presentation

        return route
    }
}
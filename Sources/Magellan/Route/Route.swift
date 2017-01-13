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

    public fileprivate(set) var presentation: (_ forTrait: UITraitCollection) -> PresentationStrategy

    let destination: (_ storyboard: UIStoryboard?) -> AnyNavigableViewController

    public init<Destination: UIViewController>(_ destination: Destination.Type, storyboardIdentifier: String? = nil) where Destination: Navigable {
        self.destinationType = destination
        self.storyboardIdentifier = storyboardIdentifier
        self.presentation = { _ in PresentationPush() }
        self.destination = {
            guard let storyboard = $0, let storyboardIdentifier = storyboardIdentifier else {
                return AnyNavigableViewController(destination.init())
            }

            let viewController = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier)
            return AnyNavigableViewController(viewController as! Destination)
        }
    }

    public func present(_ presentation: PresentationStrategy) -> Route {
        return self.present { _ in
            presentation
        }
    }

    public func present(when presentation: @escaping (UITraitCollection) -> PresentationStrategy) -> Route {
        var route = self

        route.presentation = presentation

        return route
    }
}

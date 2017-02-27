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
    public fileprivate(set) var presentation: (_ forTrait: UITraitCollection) -> PresentationStrategy

    let destination: (_ storyboard: UIStoryboard?) -> AnyNavigableViewController

    public init<Destination: UIViewController>(_ destination: Destination.Type, storyboardIdentifier: String? = nil) where Destination: Navigable {
        self.init(destination) {
            guard let storyboard = $0, let storyboardIdentifier = storyboardIdentifier else {
                return destination.init()
            }

            let viewController = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier)
            return viewController as! Destination
        }
    }

    public init<Destination: UIViewController>(_ destination: Destination.Type, using: @escaping (UIStoryboard?) -> Destination) where Destination: Navigable {
        self.destinationType = destination
        self.presentation = { _ in PresentationPush() }
        self.destination = {
            AnyNavigableViewController(using($0))
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

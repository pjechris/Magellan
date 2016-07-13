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

    public init(_ destination: UIViewController.Type, storyboardIdentifier: String? = nil) {
        self.destinationType = destination
        self.storyboardIdentifier = storyboardIdentifier
        self.presentation = { _ in PresentationPush() }
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

    func destination(usingStoryboard storyboard: UIStoryboard?) -> UIViewController {
        guard let storyboard = storyboard, let storyboardIdentifier = self.storyboardIdentifier else {
            return self.destinationType.init()
        }

        return storyboard.instantiateViewControllerWithIdentifier(storyboardIdentifier)
    }
}
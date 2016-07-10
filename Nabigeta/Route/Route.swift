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
    public let destination: UIViewController.Type
    public private(set) var presentation: (forTrait: UITraitCollection) -> PresentationStrategy

    public init(_ destination: UIViewController.Type) {
        self.destination = destination
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
}
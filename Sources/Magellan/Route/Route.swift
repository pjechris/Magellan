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
    public fileprivate(set) var presentation: (_ forTrait: UITraitCollection) -> PresentationStrategy

    let destination: UIViewController

    public init(_ destination: UIViewController) {
        self.destination = destination
        self.presentation = { _ in PresentationPush() }
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

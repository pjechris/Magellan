//
// This file is part of Nabigeta
//
// Created by JC on 04/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

public class Route : Routable {
    public let context: String
    public let destination: UIViewController.Type

    lazy public var navigationStrategy: NavigationStrategy = Strategy(route: self)

    public init(context: String, destination: UIViewController.Type) {
        self.context = context
        self.destination = destination
    }
}
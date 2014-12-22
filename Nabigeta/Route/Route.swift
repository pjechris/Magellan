//
// This file is part of Nabigeta
//
// Created by JC on 04/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

public class Route : NSObject, Routable {
    public let context: String
    public let destination: UIViewController.Type
    public let stack: NavigationStack

    lazy public var navigationStrategy: NavigationStrategy = (self.stack.isNewStack()) ? PresentStrategy(route: self) : PushStrategy(route: self)

    public init(context: String, destination: UIViewController.Type, stack: NavigationStack) {
        self.context = context
        self.destination = destination
        self.stack = stack
    }

    public convenience init(context: String, destination: UIViewController.Type) {
        self.init(context: context, destination: destination, stack: .Current)
    }
}
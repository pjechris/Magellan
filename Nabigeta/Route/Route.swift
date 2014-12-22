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
    public let name: String
    public let contextType: AnyClass
    public let destination: UIViewController.Type
    public let stack: NavigationStack

    lazy public var navigationStrategy: NavigationStrategy = (self.stack.isNewStack()) ? PresentStrategy(route: self) : PushStrategy(route: self)

    public init(name: String, context: AnyClass, destination: UIViewController.Type, stack: NavigationStack) {
        self.name = name
        self.contextType = context
        self.destination = destination
        self.stack = stack
    }

    public convenience init(name: String, context: AnyClass, destination: UIViewController.Type) {
        self.init(name: name, context: context, destination: destination, stack: .Current)
    }
}
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
    public let destination: UIViewController.Type
    public let stack: NavigationStack
    public let url: String?

    lazy public private(set) var navigationStrategy: NavigationStrategy = (self.stack.isNewStack())
        ? PresentStrategy(route: self)
        : PushStrategy(route: self)

    public init(name: String, destination: UIViewController.Type, url: String?, stack: NavigationStack) {
        self.name = name
        self.destination = destination
        self.stack = stack
        self.url = url
    }

    public convenience init(name: String, destination: UIViewController.Type, url: String?) {
        self.init(name: name, destination: destination, url: url, stack: .Current)
    }
}
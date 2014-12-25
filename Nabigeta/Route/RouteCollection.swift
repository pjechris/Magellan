//
// This file is part of Nabigeta
//
// Created by JC on 04/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

public class RouteCollection : NSObject {
    var routes: Dictionary<String, Routable> = [:]

    public func add(route: Routable) -> RouteOptions {
        self.routes[route.name] = route

        return route.options
    }

    public func add(name: String, destination: UIViewController.Type) -> RouteOptions {
        return self.add(Route(name: name, destination: destination))
    }

    public func add(name: String, destination: UIViewController.Type, stackType: UINavigationController?) -> RouteOptions {
        return self.add(Route(name: name, destination: destination, stack: .Custom(stackType)))
    }

    public func add(name: String, segue: NSString) -> RouteOptions {
        return self.add(SegueRoute(name: name, segueIdentifier: segue))
    }

    public func match(name: String) -> Routable? {
        return self.routes[name]
    }
}
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

    public func add(route: Routable) {
        self.routes[route.name] = route
    }

    public func routeByName(name: String) -> Routable? {
        return self.routes[name]
    }

    public func route(name: String, destination: UIViewController.Type) {
        self.add(Route(name: name, destination: destination))
    }

    public func route(name: String, destination: UIViewController.Type, stackType: UINavigationController?) {
        self.add(Route(name: name, destination: destination, stack: .Custom(stackType)))
    }

    public func route(name: String, segue: NSString) {
        self.add(SegueRoute(name: name, segueIdentifier: segue))
    }

    public func match(name: String) -> Routable? {
        for (_, route) in self.routes {
            if (route.name == name) {
                return route
            }
        }

        return nil
    }
}
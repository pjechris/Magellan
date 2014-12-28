//
// This file is part of Nabigeta
//
// Created by JC on 04/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit
import JLRoutes

public class RouteCollection : NSObject {
    private var routes: Dictionary<String, Routable>

    public override init() {
        self.routes = [:]
    }

    public func add(route: Routable) {
        self.routes[route.name] = route
    }

    public func add(name: String, destination: UIViewController.Type, configure: RouteOptions -> ()) {
        return self.add(Route(name: name, destination: destination, configure: configure))
    }

    public func add(name: String,
             destination: UIViewController.Type,
               stackType: UINavigationController?,
               configure: RouteOptions -> ()) {
            return self.add(Route(name: name, destination: destination, stack: .Custom(stackType), configure: configure))
    }

    public func add(name: String, segue: NSString, configure: RouteOptions -> ()) {
        return self.add(SegueRoute(name: name, segueIdentifier: segue, configure: configure))
    }

    public func find(name: String) -> Routable? {
        return self.match(name)?.route
    }

    public func match(name: String) -> MatcherResult? {
        let route = self.routes[name]

        return route != nil ? MatcherResult(route: route!, context: nil) : nil
    }
}
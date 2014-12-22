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
    var routes: Array<Routable> = []

    public func add(route: Routable) {
        self.routes.append(route)
    }

    public func route(context: String, destination: UIViewController.Type) {
        self.add(Route(context: context, destination: destination))
    }

    public func route(context: String, destination: UIViewController.Type, stackType: UINavigationController?) {
        self.add(Route(context: context, destination: destination, stack: .Custom(stackType)))
    }

    public func route(context: String, segue: NSString) {
        self.add(SegueRoute(context: context, segueIdentifier: segue))
    }

    public func match(context: String) -> Routable? {
        for route in self.routes {
            if (route.context == context) {
                return route
            }
        }

        return nil
    }
}
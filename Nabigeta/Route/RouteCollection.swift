//
// This file is part of Nabigeta
//
// Created by JC on 04/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public class RouteCollection {
    var routes: Array<Routable> = []

    public func add(route: Route) {
        self.routes.append(route)
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
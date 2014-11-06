//
// This file is part of Nabigeta
//
// Created by JC on 04/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public class RouteManager {
    var routes: Array<Routable> = []

    public func add(route: Route) {

    }

    public func route(context: String) -> Routable? {
        for route in routes {
            if (route.match(context)) {
                return route
            }
        }

        return nil
    }
}
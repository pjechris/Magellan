//
// This file is part of Nabigeta
//
// Created by JC on 12/29/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public class RouteNameMatcher : RouteMatcher {
    public typealias CriteriaType = String
    public typealias MatchResultType = Routable

    private var routes: Dictionary<String, Routable> = [:]

    public func add(route: Routable) {
        self.routes[route.name] = route
    }

    public func match(name: CriteriaType, whenMatched:(MatchResultType) -> ()) {
        let route = self.routes[name]

        if (route != nil) {
            whenMatched(route!)
        }
    }
}
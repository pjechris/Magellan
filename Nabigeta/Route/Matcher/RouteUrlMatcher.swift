//
// This file is part of Nabigeta
//
// Created by JC on 24/12/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import JLRoutes
import UIKit

public class RouteUrlMatcher {
    public typealias CriteriaType = NSURL
    public typealias MatchResultType = (route: Routable, context: AnyObject?)

    private let urlManager: JLRoutes
    private var onMatch: ((MatchResultType) -> ())?

    public init() {
        self.urlManager = JLRoutes()
    }

    public func add(route: Routable) {
        if let routeURI = route.url {
            self.urlManager.addRoute(routeURI) { [unowned self] params in
                self.onMatch!((route: route, context: nil))

                return true
            }
        }
    }

    public func match(criteria: CriteriaType, whenMatched:(MatchResultType) -> ()) {
        self.onMatch = whenMatched
        self.urlManager.routeURL(criteria)
        self.onMatch = nil
    }
}
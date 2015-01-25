//
//  RouteUrlMatcher.swift
//  Nabigeta
//
//  Created by JC on 24/12/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation
import JLRoutes
import UIKit

public class RouteUrlMatcher : RouteMatcher {
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
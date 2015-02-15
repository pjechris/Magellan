//
//  RouteURLMatcher.swift
//  Nabigeta
//
//  Created by JC on 24/12/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation
import JLRoutes
import UIKit

public class RouteURLMatcher : RouteMatcher {
    public typealias CriteriaType = NSURL
    public typealias MatchResultType = (route: Routable, context: AnyObject?)

    private let URLManager: JLRoutes
    private var onMatch: ((MatchResultType) -> ())?

    public init() {
        self.URLManager = JLRoutes()
    }

    public func add(route: Routable) {
        if let routeURI = route.URL {
            self.URLManager.addRoute(routeURI) { [unowned self] params in
                self.onMatch!((route: route, context: nil))

                return true
            }
        }
    }

    public func match(criteria: CriteriaType, whenMatched:(MatchResultType) -> ()) {
        self.onMatch = whenMatched
        self.URLManager.routeURL(criteria)
        self.onMatch = nil
    }
}
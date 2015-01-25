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

    private let urlManager: JLRoutes
    private var result: MatcherResult?

    public init() {
        self.urlManager = JLRoutes()
    }

    public func add(route: Routable) {
        if let routeURI = route.url {
            self.urlManager.addRoute(routeURI) { [unowned self] params in
                // use a method bc of a compilation error when trying to set self.result directly from the block
                // => Swift bug?
                self.setResult(route, context: nil)

                return true
            }
        }
    }

    public func setResult(route: Routable, context: AnyObject?) {
        self.result = MatcherResult(route: route, context: context)
    }

    public func match(criteria: CriteriaType) -> MatcherResult? {
        self.urlManager.routeURL(criteria)

        if let result = self.result {
            self.result = nil
            return result
        }

        return nil
    }

    public func reverse(result: MatcherResult) -> CriteriaType? {
        return nil
    }
}
//
//  RouteUrlMatcher.swift
//  Nabigeta
//
//  Created by JC on 24/12/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation

public class RouteUrlMatcher : RouteMatcher {
    public typealias CriteriaType = NSURL

    public func add(route: Routable) {

    }

    public func match(criteria: CriteriaType) -> MatcherResult? {
        return nil
    }

    public func reverse(result: MatcherResult) -> CriteriaType? {
        return nil
    }
}
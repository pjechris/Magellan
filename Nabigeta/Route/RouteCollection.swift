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
    private var nameMatcher: RouteNameMatcher
    private var urlMatcher: RouteUrlMatcher

    public override init() {
        self.nameMatcher = RouteNameMatcher()
        self.urlMatcher = RouteUrlMatcher()
    }

    public func add(route: Routable) {
        self.nameMatcher.add(route)
        self.urlMatcher.add(route)
    }

    public func add(name: String, destination: UIViewController.Type, url: String?) {
        return self.add(Route(name: name, destination: destination, url: url))
    }

    public func add(name: String,
             destination: UIViewController.Type,
               stackType: UINavigationController?,
               url: String?) {
                return self.add(Route(name: name, destination: destination, url: url, stack: .Custom(stackType)))
    }

    public func add(name: String, segue: NSString, url: String?) {
        return self.add(SegueRoute(name: name, segueIdentifier: segue, url: url))
    }

    public func find(name: String) -> Routable? {
        return self.match(name)?.route
    }

    public func match(name: String) -> MatcherResult? {
        return self.nameMatcher.match(name)
    }

    public func reverse(result: MatcherResult) -> String? {
        return self.nameMatcher.reverse(result)
    }

    public func reverse(result: MatcherResult) -> NSURL? {
        return self.urlMatcher.reverse(result)
    }
}
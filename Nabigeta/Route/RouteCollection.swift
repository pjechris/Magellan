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
    private var URLMatcher: RouteURLMatcher

    public override init() {
        self.nameMatcher = RouteNameMatcher()
        self.URLMatcher = RouteURLMatcher()
    }

    public func add(route: Routable) {
        self.nameMatcher.add(route)
        self.URLMatcher.add(route)
    }

    public func add(name: String, destination: UIViewController.Type, URL: String?) {
        return self.add(Route(name: name, destination: destination, URL: URL))
    }

    public func add(name: String,
             destination: UIViewController.Type,
               stackType: UINavigationController?,
               URL: String?) {
                return self.add(Route(name: name, destination: destination, URL: URL, stack: .Custom(stackType)))
    }

    public func add(name: String, segue: NSString, URL: String?) {
        return self.add(SegueRoute(name: name, segueIdentifier: segue as String, URL: URL))
    }

    public func matchName(name: String, whenMatched:(RouteNameMatcher.MatchResultType) -> ()) {
        self.nameMatcher.match(name, whenMatched: whenMatched)
    }

    public func matchURL(URL: NSURL, whenMatched:(RouteURLMatcher.MatchResultType) -> ()) {
        self.URLMatcher.match(URL, whenMatched: whenMatched)
    }
}
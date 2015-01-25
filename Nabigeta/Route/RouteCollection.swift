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

    public func add(name: String, destination: UIViewController.Type, context: AnyObject.Type, url: String? = nil) {
        return self.add(Route(name: name, destination: destination, context: context, url: url, stack: .Current))
    }

    public func add(name: String,
        url: String?,
        destination: UIViewController.Type,
        context: AnyObject.Type,
        stackType: UINavigationController?) {
            return self.add(Route(name: name,destination: destination, context: context, url: url, stack: .Custom(stackType)))
    }

    public func add(name: String, segue: NSString, context: AnyObject.Type, url: String?) {
        return self.add(SegueRoute(name: name, segueIdentifier: segue, context: context, url: url))
    }

    public func match(name: String, whenMatched:(RouteNameMatcher.MatchResultType) -> ()) {
        self.nameMatcher.match(name, whenMatched: whenMatched)
    }

    public func match(url: NSURL, whenMatched:(RouteUrlMatcher.MatchResultType) -> ()) {
        self.urlMatcher.match(url, whenMatched: whenMatched)
    }
}
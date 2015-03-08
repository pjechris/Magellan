//
//  RouteCollection.swift
//  Nabigeta
//
//  Created by JC on 04/11/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation
import UIKit

public class Navigator : NSObject {
    public var before: ((UIViewController, AnyObject?) -> Void)?
    public var stackSupplier: (() -> UINavigationController)?
    private var routesCollection: Array<RouteCollection>
    private var urlMatcher: RouteUrlMatcher

    public override init() {
        self.routesCollection = []
        self.urlMatcher = RouteUrlMatcher()
    }

    public convenience init(routeCollection: RouteCollection) {
        self.init()
        self.importCollection(routeCollection)
    }

    public func importCollection(routeCollection: RouteCollection) {
        self.routesCollection.append(routeCollection)

        for (name, route) in routeCollection {
            self.urlMatcher.add(route)
        }
    }

    @objc(navigate:context:sender:)
    public func navigate(name: String, context: AnyObject, sender: UIViewController) {
        for routes in self.routesCollection {
            routes[name].map { route in
                self.navigate(route, context: context, sender: sender)
            }
        }
    }

    @objc(navigateURL:sender:)
    public func navigate(url: NSURL, sender: UIViewController) {
        self.urlMatcher.match(url) { route, context in
            self.navigate(route, context: context, sender: sender)
        }
    }

    private func navigate(route: Routable, context: AnyObject?, sender: UIViewController) {
        let navContext = NavigationContext(source: sender, route: route, context: context) { destination in
            self.before?(destination, context)
            return ()
        }

        navContext.willSupplyStack = self.stackSupplier

        sender.navigationContext = navContext
        route.presentation.strategy().show(navContext)
    }

    public func navigateBack(sender: UIViewController) {
        sender.navigationContext?.route.presentation.strategy().dismiss(sender)
    }

    public func redirect() {

    }

    public func urlFor(name: String, context: AnyObject) -> String? {
        // 1. retrieve route by name
        // 2. generate url
        return nil
    }
}
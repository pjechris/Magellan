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

    public override init() {
        self.routesCollection = []
    }

    public convenience init(routeCollection: RouteCollection) {
        self.init()
        self.importCollection(routeCollection)
    }

    public func importCollection(routeCollection: RouteCollection) {
        self.routesCollection.append(routeCollection)
    }

    @objc(navigate:context:sender:)
    public func navigate(name: String, context: AnyObject, sender: UIViewController) {
        for routes in self.routesCollection {
            routes.matchName(name) { route in
                self.navigate(route, context: context, sender: sender)
            }
        }
    }

    @objc(navigateURL:sender:)
    public func navigate(URL: NSURL, sender: UIViewController) {
        for routes in self.routesCollection {
            routes.matchURL(URL) { route, context in
                self.navigate(route, context: context, sender: sender)
            }
        }
    }

    private func navigate(route: Routable, context: AnyObject?, sender: UIViewController) {
        let navContext = NavigationContext(source: sender, route: route, context: context) { destination in
            self.before?(destination, context)
            return ()
        }

        navContext.willSupplyStack = self.stackSupplier

        sender.navigationContext = navContext
        route.navigationStrategy.navigate(navContext)
    }

    public func navigateBack(sender: UIViewController) {
        sender.navigationContext?.route.navigationStrategy.navigateBack(sender)
    }

    public func redirect() {

    }

    public func URLFor(name: String, context: AnyObject) -> String? {
        // 1. retrieve route by name
        // 2. generate URL
        return nil
    }
}
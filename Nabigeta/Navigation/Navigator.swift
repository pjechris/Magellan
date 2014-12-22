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
    public var before: ((UIViewController, AnyObject) -> Void)?
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
        self.routesCollection.append(routeCollection);
    }

    public func navigate(context: String, sender: UIViewController) {
        for routes in self.routesCollection {
            let route: Routable! = routes.match(context)

            if (route != nil) {
                let navContext = NavigationContext(source: sender)

                navContext.willSupplyStack = self.stackSupplier
                navContext.didUpdateContext = { destination in
                    self.before?(destination, context)
                    return ()
                }

                route!.navigationStrategy.navigate(navContext)

                return
            }
        }
    }

    public func redirect() {

    }
}
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
        self.routesCollection.append(routeCollection)
    }

    @objc(navigate:context:sender:)
    public func navigate(name: String, context: AnyObject, sender: UIViewController) {
        for routes in self.routesCollection {
            let result = routes.match(name)

            if let match = result {
                let navContext = NavigationContext(source: sender, route: match.route, context: context) { destination in
                    self.before?(destination, context)
                    return ()
                }

                navContext.willSupplyStack = self.stackSupplier

                match.route.navigationStrategy.navigate(navContext)

                return
            }
        }
    }

    public func navigateBack(sender: UIViewController) {
        sender.navigationContext?.route.navigationStrategy.navigateBack(sender)
    }

    public func redirect() {

    }
}
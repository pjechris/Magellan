//
//  RouteManager.swift
//  Nabigeta
//
//  Created by JC on 04/11/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation

public class Navigator {
    let routeManager = RouteManager()

    public func navigate(context: String) {
        let route: Routable! = self.routeManager.route(context)

        if (route == nil) {
            return
        }

        route.navigationStrategy.execute(route)
    }

    public func redirect() {

    }
}
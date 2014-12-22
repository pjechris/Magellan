//
//  RouteManager.swift
//  Nabigeta
//
//  Created by JC on 04/11/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation
import UIKit

public class Navigator {
    public var before: ((UIViewController, AnyObject) -> Void)?

    private let routeManager = RouteManager()

    public func navigate(context: String, sender: UIViewController) {
            let route: Routable! = self.routeManager.match(context)

            if (route != nil) {
                let navContext = NavigationContext(source: sender)

                navContext.didUpdateContext = { destination in
                    self.before?(destination, context)
                    return ()
                }

                route!.navigationStrategy.navigate(navContext)

                return
        }
    }

    public func redirect() {

    }
}
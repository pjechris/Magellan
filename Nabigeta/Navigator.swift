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
    let routeManager = RouteManager()

    public func navigate(context: String, sender: UIViewController) {
        let route: Routable! = self.routeManager.match(context)

        if (route == nil) {
            return
        }

        route!.navigationStrategy.navigate(route!, senderViewController: sender)
    }

    public func redirect() {

    }
}
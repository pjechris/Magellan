//
//  SegueStrategy.swift
//  Nabigeta
//
//  Created by JC on 06/11/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation

public class SegueStrategy: NavigationStrategy {
    private let route: SegueRoute

    public init(route: SegueRoute) {
        self.route = route
    }

    public func navigate(sender: UIViewController) {
        sender.performSegueWithIdentifier(self.route.segueIdentifier, sender: sender)
    }

    public func navigateBack(sender: UIViewController) {
    }
}
//
//  SegueStrategy.swift
//  Nabigeta
//
//  Created by JC on 06/11/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation

public class SegueStrategy: NavigationStrategy {
    public func navigate(route: Routable, senderViewController: UIViewController) {
        var identifier:String? = nil
        senderViewController.performSegueWithIdentifier(identifier, sender: senderViewController)
    }

    public func navigateBack() {
    }
}
//
//  SegueRoute.swift
//  Nabigeta
//
//  Created by JC on 01/12/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation

public class SegueRoute : NSObject, Routable {
    public let context: String
    public let segueIdentifier: String

    lazy public var navigationStrategy: NavigationStrategy = SegueStrategy(route: self)

    public init(context: String, segueIdentifier: String) {
        self.context = context
        self.segueIdentifier = segueIdentifier
    }
}
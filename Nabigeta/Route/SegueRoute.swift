//
//  SegueRoute.swift
//  Nabigeta
//
//  Created by JC on 01/12/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation

public class SegueRoute : NSObject, Routable {
    public let name: String
    public let contextType: AnyClass
    public let segueIdentifier: String

    lazy public var navigationStrategy: NavigationStrategy = SegueStrategy(route: self)

    public init(name: String, context: AnyClass, segueIdentifier: String) {
        self.name = name
        self.contextType = context
        self.segueIdentifier = segueIdentifier
    }
}
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
    public let segueIdentifier: String
    public let url: String?

    lazy public private(set) var navigationStrategy: NavigationStrategy = SegueStrategy(route: self)

    public init(name: String, segueIdentifier: String, url: String?) {
        self.name = name
        self.segueIdentifier = segueIdentifier
        self.url = url
    }
}
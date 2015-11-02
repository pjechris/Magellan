//
//  NavigationCollection.swift
//  Nabigeta
//
//  Created by JC on 29/10/15.
//  Copyright © 2015 fr.milkshake. All rights reserved.
//

import Foundation

public class NavigationCollection : NSObject {
    public var routes: RouteCollection = RouteCollection()
    public var transitions: TransitionCollection = TransitionCollection()
}
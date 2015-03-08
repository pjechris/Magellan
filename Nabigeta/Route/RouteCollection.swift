//
// This file is part of Nabigeta
//
// Created by JC on 04/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

@objc
public class RouteCollection : SequenceType {
    private var routes : Dictionary<String, Routable>

    public init() {
        self.routes = [:]
    }

    public func add(route: Routable) {
        self.routes[route.name] = route
    }

    public subscript(name: String) -> Routable? {
        get { return self.routes[name] }
    }

    public func generate() -> DictionaryGenerator<String, Routable> {
        return self.routes.generate()
    }
}
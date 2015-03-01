//
// This file is part of Nabigeta
//
// Created by JC on 04/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

public class RouteCollection : SequenceType {
    private var routes : Dictionary<String, Routable>

    public init() {
        self.routes = [:]
    }

    public func add(route: Routable) {
        self.routes[route.name] = route
    }

    public func add(name: String, destination: UIViewController.Type, context: AnyObject.Type, url: String? = nil) {
        return self.add(Route(name: name, destination: destination, context: context, url: url, stack: .Current))
    }

    public func add(name: String,
        url: String?,
        destination: UIViewController.Type,
        context: AnyObject.Type,
        stackType: UINavigationController?) {
            return self.add(Route(name: name,destination: destination, context: context, url: url, stack: .Custom(stackType)))
    }

    public func add(name: String, segue: NSString, context: AnyObject.Type, url: String?) {
        return self.add(SegueRoute(name: name, segueIdentifier: segue, context: context, url: url))
    }

    public subscript(name: String) -> Routable? {
        get { return self.routes[name] }
    }

    public func generate() -> DictionaryGenerator<String, Routable> {
        return self.routes.generate()
    }
}
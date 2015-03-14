//
//  RouteCollection.swift
//  Nabigeta
//
//  Created by JC on 04/11/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation
import UIKit

public class Navigator : NSObject {
    public var willNavigate: ((UIViewController, AnyObject?) -> Void)? {
        get { return self.navigationDelegate.willNavigate }
        set { self.navigationDelegate.willNavigate = newValue }
    }

    private var routesCollection: Array<RouteCollection>
    private var urlMatcher: RouteUrlMatcher
    private let navigationDelegate: NavigationDelegate

    public override init() {
        self.routesCollection = []
        self.urlMatcher = RouteUrlMatcher()
        self.navigationDelegate = NavigationDelegate()
    }

    public convenience init(routeCollection: RouteCollection) {
        self.init()
        self.importCollection(routeCollection)
    }

    public func importCollection(routeCollection: RouteCollection) {
        self.routesCollection.append(routeCollection)

        for (name, route) in routeCollection {
            self.urlMatcher.add(route)
        }
    }

    @objc(navigate:context:sender:)
    public func navigate(name: String, context: AnyObject, sender: UIViewController) {
        for routes in self.routesCollection {
            routes[name].map { route in
                self.navigate(route, context: context, sender: sender)
            }
        }
    }

    @objc(navigateURL:sender:)
    public func navigate(url: NSURL, sender: UIViewController) {
        self.urlMatcher.match(url) { route, context in
            self.navigate(route, context: context, sender: sender)
        }
    }

    private func navigate(route: Routable, context: AnyObject?, sender: UIViewController) {
        let navigationController = sender.navigationController
        let navContext = NavigationContext(source: sender, route: route, context: context)

        self.navigationDelegate.navigationControllerDelegate = navigationController?.delegate
        navigationController?.delegate = self.navigationDelegate

        sender.navigationContext = navContext
        navContext.presenter.show(navContext)
    }

    public func navigateBack(sender: UIViewController) {
        sender.navigationContext?.presenter.dismiss(sender)
    }

    public func redirect() {

    }

    public func urlFor(name: String, context: AnyObject) -> String? {
        // 1. retrieve route by name
        // 2. generate url
        return nil
    }
}
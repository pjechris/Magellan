//
//  Strategy.swift
//  Nabigeta
//
//  Created by JC on 06/11/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation
import UIKit

public class PushStrategy : PresentationStrategy {
    private let route: Route

    public init(route: Route) {
        self.route = route
    }

    public func show(navigationContext: NavigationContext) {
        var destinationViewController: UIViewController = self.route.destination()
        var stackController = navigationContext.sourceViewController.navigationController!

        navigationContext.updateContext(destinationViewController)
        stackController.pushViewController(destinationViewController, animated: true)
    }

    public func dismiss(sender: UIViewController) {
        sender.navigationController?.popToViewController(sender, animated: true)
    }
}
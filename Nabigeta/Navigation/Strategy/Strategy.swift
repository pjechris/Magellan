//
//  Strategy.swift
//  Nabigeta
//
//  Created by JC on 06/11/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation
import UIKit

public class Strategy : NavigationStrategy {
    private let route: Route

    public init(route: Route) {
        self.route = route
    }

    public func navigate(sender: UIViewController) {
        var destinationViewController: UIViewController = route.destination()
        var navigationController = sender.navigationController

        navigationController?.pushViewController(destinationViewController, animated: true)
    }

    public func navigateBack(sender: UIViewController) {

    }
}
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
    public func navigate(route: Routable, senderViewController: UIViewController) {
        var destinationViewController: UIViewController = route.destination()
        var navigationController = senderViewController.navigationController

        navigationController?.pushViewController(destinationViewController, animated: true)
    }

    public func navigateBack() {

    }
}
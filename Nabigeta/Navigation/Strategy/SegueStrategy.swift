//
//  SegueStrategy.swift
//  Nabigeta
//
//  Created by JC on 06/11/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation
import UIKit

public class SegueStrategy: NavigationStrategy {
    private let route: SegueRoute

    public init(route: SegueRoute) {
        self.route = route
    }

    @objc public func navigate(navigationContext: NavigationContext) {
        let handler = SegueNavigationHandler()
        let source = navigationContext.sourceViewController

        handler.prepareSegueHandler = { segue in
            if let destination = segue.destinationViewController as? UIViewController {
                if let navigationController = destination as? UINavigationController {
                    navigationContext.updateContext(navigationController.topViewController)
                } else {
                    navigationContext.updateContext(destination)
                }
            }
        }

        source.segueHandler = handler
        source.performSegueWithIdentifier(self.route.segueIdentifier as String, sender: source)
    }

    @objc public func navigateBack(sender: UIViewController) {
    }
}
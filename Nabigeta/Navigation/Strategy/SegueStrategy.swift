//
//  SegueStrategy.swift
//  Nabigeta
//
//  Created by JC on 06/11/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation
import UIKit

public class SegueStrategy: PresentationStrategy {
    private let route: SegueRoute

    public init(route: SegueRoute) {
        self.route = route
    }

    public func show(navigationContext: NavigationContext) {
        let handler = SegueNavigationHandler()
        let source = navigationContext.sourceViewController

        handler.prepareSegueHandler = { segue in
            var destination = segue.destinationViewController as UIViewController

            if let navigationController = destination as? UINavigationController {
                destination = navigationController.topViewController
            }

            navigationContext.updateContext(destination)
        }

        source.segueHandler = handler
        source.performSegueWithIdentifier(self.route.segueIdentifier, sender: source)
    }

    public func dismiss(sender: UIViewController) {
    }
}
//
//  Strategy.swift
//  Nabigeta
//
//  Created by JC on 06/11/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation
import UIKit

extension PresentationPush {
    public enum DisplayMode {
        case master
        case detail
    }
}

open class PresentationPush : PresentationStrategy {
    let displayMode: DisplayMode

    public init(displayMode: DisplayMode = .master) {
        self.displayMode = displayMode
    }

    open func show(_ navigationContext: NavigationContext) {
        let destinationViewController: UIViewController = navigationContext.destinationViewController
        let stackController = navigationContext.sourceViewController.navigationController!

        switch self.displayMode {
        case .master:
            stackController.show(destinationViewController, sender: navigationContext.sourceViewController)
        case .detail:
            stackController.showDetailViewController(destinationViewController, sender: navigationContext.sourceViewController)
        }

    }

    open func dismiss(_ context: NavigationContext) {
        _ = context
            .sourceViewController
            .navigationController?
            .popToViewController(context.sourceViewController, animated: true)
    }
}

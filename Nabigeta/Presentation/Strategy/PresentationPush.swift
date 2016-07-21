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
        case Master
        case Detail
    }
}

public class PresentationPush : PresentationStrategy {
    let displayMode: DisplayMode

    init(displayMode: DisplayMode = .Master) {
        self.displayMode = displayMode
    }

    public func show(navigationContext: NavigationContext) {
        let destinationViewController: UIViewController = navigationContext.destinationViewController
        let stackController = navigationContext.sourceViewController.navigationController!

        switch self.displayMode {
        case .Master:
            stackController.showViewController(destinationViewController, sender: navigationContext.sourceViewController)
        case .Detail:
            stackController.showDetailViewController(destinationViewController, sender: navigationContext.sourceViewController)
        }

    }

    public func dismiss(sender: UIViewController) {
        sender.navigationController?.popToViewController(sender, animated: true)
    }
}
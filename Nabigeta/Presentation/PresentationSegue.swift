//
//  SegueStrategy.swift
//  Nabigeta
//
//  Created by JC on 06/11/14.
//  Copyright (c) 2014 fr.milkshake. All rights reserved.
//

import Foundation
import UIKit

public class PresentationSegue: PresentationStrategy {
    let segueIdentifier: String

    public init(_ segueIdentifier: String) {
        self.segueIdentifier = segueIdentifier
    }

    public func show(navigationContext: NavigationContext) {
        let source = navigationContext.sourceViewController

        source.performSegueWithIdentifier(self.segueIdentifier, sender: source)
    }

    public func dismiss(sender: UIViewController) {
    }
}
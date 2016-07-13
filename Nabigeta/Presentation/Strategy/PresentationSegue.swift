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
    let segueType: UIStoryboardSegue.Type

    public init(_ segue: UIStoryboardSegue.Type) {
        self.segueType = segue
    }

    public func show(context: NavigationContext) {
        let segue = self.segueType
            .init(identifier: nil, source: context.sourceViewController, destination: context.destinationViewController)

        segue.perform()
    }

    public func dismiss(sender: UIViewController) {
    }
}
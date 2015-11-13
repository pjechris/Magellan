//
// This file is part of Nabigeta
//
// Created by JC on 29/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public struct PresentationAdaptiveCollection {
    var transitions:[PresentationAdaptiveContext:[PresentationAdaptive]] = [:]

    public mutating func when(from from: UIViewController.Type, to: UIViewController.Type, @noescape definition: (PresentationAdaptiveBuilder) -> Void) {
        self.when(from, to: to, definition: definition)
    }

    public mutating func when(to to: UIViewController.Type, @noescape definition: (PresentationAdaptiveBuilder) -> Void) {
        self.when(nil, to: to, definition: definition)
    }

    private mutating func when(from: UIViewController.Type?, to: UIViewController.Type, @noescape definition: (PresentationAdaptiveBuilder) -> Void) {
        let builder = PresentationAdaptiveBuilder()

        definition(builder)

        self.transitions[PresentationAdaptiveContext(from: from, to: to)] = builder.transitions
    }

    internal func transitionFor(from: UIViewController.Type, to: UIViewController.Type, trait: UITraitCollection) -> PresentationAdaptive? {
        let transitionsFromTo = PresentationAdaptiveContext(from: from, to: to)
        let transitionsTo = PresentationAdaptiveContext(to: to)
        let transitions = self.transitions[transitionsFromTo] ?? self.transitions[transitionsTo]

        if transitions != nil {
            for transition in transitions! {
                if (trait.containsTraitsInCollection(transition.trait)) {
                    return transition
                }
            }
        }

        return nil
    }
}
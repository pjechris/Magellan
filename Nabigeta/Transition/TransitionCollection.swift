//
// This file is part of Nabigeta
//
// Created by JC on 29/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public struct TransitionCollection {
    var transitions:[TransitionContext:[Transition]] = [:]

    public mutating func add(from: UIViewController.Type, to: UIViewController.Type, @noescape definition: (TransitionBuilder) -> Void) {
        let builder = TransitionBuilder()

        definition(builder)

        self.transitions[TransitionContext(from: from, to: to)] = builder.transitions
    }

    internal func transitionFor(from: UIViewController.Type, to: UIViewController.Type, trait: UITraitCollection) -> Transition? {
        var defaultTransition: Transition? = nil

        if let transitions = self.transitions[TransitionContext(from: from, to: to)] {
            for transition in transitions {
                if transition.trait != nil {
                    if (transition.trait!.containsTraitsInCollection(trait)) {
                        return transition
                    }
                }
                else {
                    defaultTransition = transition
                }
            }
        }

        return defaultTransition
    }
}
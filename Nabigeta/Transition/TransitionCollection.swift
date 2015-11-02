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

    public mutating func add(from from: UIViewController.Type, to: UIViewController.Type, @noescape definition: (TransitionBuilder) -> Void) {
        self.add(from, to: to, definition: definition)
    }

    public mutating func add(to to: UIViewController.Type, @noescape definition: (TransitionBuilder) -> Void) {
        self.add(nil, to: to, definition: definition)
    }

    private mutating func add(from: UIViewController.Type?, to: UIViewController.Type, @noescape definition: (TransitionBuilder) -> Void) {
        let builder = TransitionBuilder()

        definition(builder)

        self.transitions[TransitionContext(from: from, to: to)] = builder.transitions
    }

    internal func transitionFor(from: UIViewController.Type, to: UIViewController.Type, trait: UITraitCollection) -> Transition? {
        var defaultTransition: Transition? = nil
        let transitionsFromTo = TransitionContext(from: from, to: to)
        let transitionsTo = TransitionContext(to: to)
        let transitions = self.transitions[transitionsFromTo] ?? self.transitions[transitionsTo]

        if transitions != nil {
            for transition in transitions! {
                if transition.trait != nil {
                    if (trait.containsTraitsInCollection(transition.trait!)) {
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
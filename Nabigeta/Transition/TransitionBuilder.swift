//
// This file is part of Nabigeta
//
// Created by JC on 29/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public class TransitionBuilder {
    internal var transitions:[Transition] = []

    public func setPresentation(presentation: PresentationStyle, _ trait: UITraitCollection? = nil) {
        self.transitions.append(Transition(presentation: presentation, trait: trait))
    }

    public func setPresentation(presentation: PresentationStyle, _ horizontalSizeClass: UIUserInterfaceSizeClass) {
        let trait = UITraitCollection(horizontalSizeClass: horizontalSizeClass)

        self.setPresentation(presentation, trait)
    }

    public func setPresentation(presentation: PresentationStyle, _ horizontalSizeClass: UIUserInterfaceSizeClass, _ verticalSizeClass: UIUserInterfaceSizeClass) {
        let trait = UITraitCollection(traitsFromCollections: [
            UITraitCollection(horizontalSizeClass: horizontalSizeClass),
            UITraitCollection(verticalSizeClass: verticalSizeClass)
            ])

        self.setPresentation(presentation, trait)
    }
}
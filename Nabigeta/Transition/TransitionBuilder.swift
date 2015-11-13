//
// This file is part of Nabigeta
//
// Created by JC on 29/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public class TransitionBuilder {
    internal var transitions:[PresentationAdaptive] = []

    public func addAdaptivePresentation(presentation: PresentationStrategy, _ trait: UITraitCollection) {
        self.transitions.append(PresentationAdaptive(presentation: presentation, trait: trait))
    }

    public func addAdaptivePresentation(presentation: PresentationStrategy, _ horizontalSizeClass: UIUserInterfaceSizeClass) {
        let trait = UITraitCollection(horizontalSizeClass: horizontalSizeClass)

        self.addAdaptivePresentation(presentation, trait)
    }

    public func addAdaptivePresentation(presentation: PresentationStrategy, _ horizontalSizeClass: UIUserInterfaceSizeClass, _ verticalSizeClass: UIUserInterfaceSizeClass) {
        let trait = UITraitCollection(traitsFromCollections: [
            UITraitCollection(horizontalSizeClass: horizontalSizeClass),
            UITraitCollection(verticalSizeClass: verticalSizeClass)
            ])

        self.addAdaptivePresentation(presentation, trait)
    }
}
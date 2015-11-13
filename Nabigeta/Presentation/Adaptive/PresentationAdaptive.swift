//
// This file is part of Nabigeta
//
// Created by JC on 29/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public struct PresentationAdaptive : PresentationStrategy {
    let presentation: PresentationStrategy
    let trait: UITraitCollection

    public func show(navigationContext: NavigationContext, willShow: PresentationWillShowHandler?) {
        self.presentation.show(navigationContext, willShow: willShow)
    }

    public func dismiss(sender: UIViewController) {
        self.presentation.dismiss(sender)
    }
}
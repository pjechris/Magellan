//
// This file is part of Nabigeta
//
// Created by JC on 08/03/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public enum PresentationStyle {
    case Push
    case Show(PresentationPushMode)
    case Modal
    case Present(UIModalPresentationStyle?, UIModalTransitionStyle?)
    case Segue(String)

    public func presenter() -> PresentationStrategy {
        switch (self) {
        case .Push:
            return PresentationPush()
        case .Show(let mode):
            return PresentationPush(pushMode: mode)
        case .Modal:
            return PresentationModal()
        case .Present(let presentation, let transition):
            return PresentationModal(presentation: presentation, transition: transition)
        case .Segue(let segueIdentifier):
            return PresentationSegue(segueIdentifier)
        }
    }
}
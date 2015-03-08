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
    case Modal
    case Segue(segueIdentifier: String)

    public func strategy() -> PresentationStrategy {
        switch (self) {
        case .Push:
            return PushStrategy()
        case .Modal:
            return PresentationStrategy()
        case .Segue(let segueIdentifier):
            return SegueStrategy(segueIdentifier)
        }
    }
}
//
// This file is part of Nabigeta
//
// Created by JC on 11/07/16.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

extension PresentingContext {
    public enum TerminateStatus {
        case completed
        case aborted
    }
}

open class PresentingContext {
    let context: NavigationContext
    let presentation: PresentationStrategy

    init(context: NavigationContext, presentation: PresentationStrategy) {
        self.context = context
        self.presentation = presentation
    }

    open func terminate(_ status: TerminateStatus = .completed) {
        let sourceViewController = self.context.sourceViewController

        guard let navigation = sourceViewController.navigation else {
            return
        }

        navigation.navigateBack(to: sourceViewController)
    }
}

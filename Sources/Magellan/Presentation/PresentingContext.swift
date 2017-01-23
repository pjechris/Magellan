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
    fileprivate var willDismiss: (TerminateStatus) -> () = { _ in }

    init(context: NavigationContext, presentation: PresentationStrategy) {
        self.context = context
        self.presentation = presentation
    }

    open func onDismiss(_ willDismiss: @escaping (TerminateStatus) -> ()) -> PresentingContext {
        self.willDismiss = willDismiss

        return self
    }

    open func terminate(_ status: TerminateStatus = .completed) {
        let sourceViewController = self.context.sourceViewController

        guard let navigation = sourceViewController.navigation else {
            return
        }

        self.willDismiss(status)
        navigation.navigateBack(to: sourceViewController)
    }
}

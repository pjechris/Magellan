//
// This file is part of Nabigeta
//
// Created by JC on 20/08/16.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

/// Used internally when presenting a root controller
class PresentationRoot : PresentationStrategy {

    func show(_ context: NavigationContext) {
        // no animation done.
    }

    func dismiss(_ context: NavigationContext) {
        _ = context
            .sourceViewController
            .navigationController?
            .popToRootViewController(animated: true)
    }
}

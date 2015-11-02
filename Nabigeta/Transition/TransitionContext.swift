//
// This file is part of Nabigeta
//
// Created by JC on 29/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

internal struct TransitionContext : Hashable {
    let fromViewController: UIViewController.Type?
    let toViewController: UIViewController.Type

    var hashValue: Int {
        get { return self.toViewController.hash() ^ (fromViewController?.hash() ?? 1) }
    }

    init(from: UIViewController.Type?, to: UIViewController.Type) {
        self.fromViewController = from
        self.toViewController = to
    }

    init(to: UIViewController.Type) {
        self.init(from: nil, to: to)
    }
}

func ==(lhs: TransitionContext, rhs: TransitionContext) -> Bool {
    return lhs.toViewController == rhs.toViewController && lhs.fromViewController == rhs.fromViewController
}


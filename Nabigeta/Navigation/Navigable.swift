//
// This file is part of Nabigeta
//
// Created by JC on 12/07/16.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

/// Used by navigable `UIViewController` to be informed when navigation events occured.
public protocol Navigable {
    associatedtype ContextType

    /// Tells the model that navigation was performed on it with given context
    /// @param context context passed by the navigation.
    func didNavigate(to context: ContextType)
}

class AnyNavigableViewController {
    private(set) var viewController: UIViewController

    private let didNavigate: (Any) -> Void

    init<N: UIViewController where N: Navigable>(_ navigable: N) {
        self.viewController = navigable

        self.didNavigate = { context in
            if let context = context as? N.ContextType {
                navigable.didNavigate(to: context)
            }
        }
    }

    func didNavigate(to context: Any) {
        self.didNavigate(context)
    }
}
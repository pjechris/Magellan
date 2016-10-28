//
// This file is part of Nabigeta
//
// Created by JC on 22/12/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

/**
* Provides contextual information about navigation between two view controllers.
*
* During navigation this object is automatically created and passed to any `PresentationStrategy`.
*
*/
public class NavigationContext {
    /// the view controller requiring navigation
    unowned public let sourceViewController: UIViewController

    unowned public var destinationViewController: UIViewController {
        get { return self.anyDestinationViewController.viewController }
    }

    weak public private(set) var touchedControl: UIControl?

    let anyDestinationViewController: AnyNavigableViewController

    convenience init(source: UIViewController, destination: AnyNavigableViewController) {
        self.init(source: source, destination: destination, control: nil)
    }

    init(source: UIViewController, destination: AnyNavigableViewController, control: UIControl?) {
        self.sourceViewController = source
        self.anyDestinationViewController = destination
        self.touchedControl = control
    }
}
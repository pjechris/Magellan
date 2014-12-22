//
// This file is part of Nabigeta
//
// Created by JC on 22/12/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

public class SegueNavigationHandler {
    public var prepareSegueHandler: ((UIStoryboardSegue) -> Void)? = nil

    public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.prepareSegueHandler?(segue)
    }
}
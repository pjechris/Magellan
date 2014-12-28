//
// This file is part of Nabigeta
//
// Created by JC on 04/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public protocol Routable
{
    var name: String { get }
    var navigationStrategy: NavigationStrategy { get }

    var options: RouteOptions { get }
}
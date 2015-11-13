//
// This file is part of Nabigeta
//
// Created by JC on 29/10/15.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public class NavigationCollection : NSObject {
    public var routes: RouteCollection = RouteCollection()
    public var presentations: PresentationAdaptiveCollection = PresentationAdaptiveCollection()
}
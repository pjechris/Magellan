//
// This file is part of Nabigeta
//
// Created by JC on 25/12/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

/**
 * Provide optional parameters for any route you define
*/
public class RouteOptions {
    public private(set) var uris = Array<String>()

    public func routableBy(#uri: String) -> RouteOptions {
        return self.routableBy(uris: [uri])
    }

    public func routableBy(#uris: Array<String>) -> RouteOptions {
        self.uris = uris

        return self
    }
}
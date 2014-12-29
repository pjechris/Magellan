//
// This file is part of Nabigeta
//
// Created by JC on 29/12/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public struct RouteURI {
    public let uri: String
    public let mapper: NSValueTransformer

    public init(uri: String, mapper: NSValueTransformer) {
        self.uri = uri
        self.mapper = mapper
    }
}
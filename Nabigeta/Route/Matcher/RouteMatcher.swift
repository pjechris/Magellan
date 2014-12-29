//
// This file is part of Nabigeta
//
// Created by JC on 28/12/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public protocol RouteMatcher {
    typealias CriteriaType

    func add(route: Routable)

    func match(criteria: CriteriaType) -> MatcherResult?

    func reverse(result: MatcherResult) -> CriteriaType?
}
//
// This file is part of Nabigeta
//
// Created by JC on 11/07/16.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public class PresentingContext {
    let context: NavigationContext
    let presentation: PresentationStrategy

    init(context: NavigationContext, presentation: PresentationStrategy) {
        self.context = context
        self.presentation = presentation
    }
}
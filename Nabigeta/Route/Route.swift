//
// This file is part of Nabigeta
//
// Created by JC on 04/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

public class Route : NSObject, Routable {
    public let name: String
    public let destination: UIViewController.Type
    public let url: String?
    public let context: AnyObject.Type
    public let presentation: PresentationStyle

    public init(name: String, destination: UIViewController.Type, context: AnyObject.Type, url: String?, presentation: PresentationStyle) {
        self.name = name
        self.destination = destination
        self.url = url
        self.context = context
        self.presentation = presentation
    }
}
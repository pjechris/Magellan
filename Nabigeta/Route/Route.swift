//
// This file is part of Nabigeta
//
// Created by JC on 04/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation

public class Route : Routable{
    public let context: String
    public let destination: UIViewController.Type

    public init(context: String, destination: UIViewController.Type) {
        self.context = context
        self.destination = destination
    }
}



// Route.new(context: MyModel.Type, destination: ViewController.Type, when: { |context, sourceController| return true return false })
// StoryboardRoute.new(context:, destination:@"" when:)
// SegureRoute.new()
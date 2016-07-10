//
// This file is part of Nabigeta
//
// Created by JC on 04/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

public class Navigation {
    public var willNavigate: PresentationWillShowHandler?

    private var router: (Any -> Route)?

    public func navigate(name: String, context: Any, sender: UIViewController) {
        if let route = self.router?(context) {
            self.navigate(NavigationContext.init(context: context, route: route, source: sender))

            return
        }
    }

    public func navigate(name: String, context: AnyObject, sender: UIControl) {
        if let route = self.router?(context) {
            self.navigate(NavigationContext.init(context: context, route: route, source: sender))

            return
        }
    }

    private func navigate(context: NavigationContext) {
        context.traitCollection = UIApplication.sharedApplication().keyWindow!.traitCollection
        context.sourceViewController.navigationContext = context
        context.presenter(self.collection.presentations).show(context, willShow: self.willNavigate)
    }

    public func navigateBack(sender: UIViewController) {
        sender.navigationContext?.presenter(self.collection.presentations).dismiss(sender)
    }
}

//
// This file is part of Nabigeta
//
// Created by JC on 04/11/14.
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code
//

import Foundation
import UIKit

public class Navigation : NSObject {
    public var willNavigate: PresentationWillShowHandler?

    private var collection: NavigationCollection

    public init(collection: NavigationCollection) {
        self.collection = collection
    }

    @objc(navigate:context:sender:)
    public func navigate(name: String, context: AnyObject, sender: UIViewController) {
        if let route = self.collection.routes[name] {
            self.navigate(NavigationContext.init(context: context, route: route, source: sender))

            return
        }
    }

    @objc(navigate:context:fromControl:)
    public func navigate(name: String, context: AnyObject, sender: UIControl) {
        if let route = self.collection.routes[name] {
            self.navigate(NavigationContext.init(context: context, route: route, source: sender))

            return
        }
    }

    // URL routing is not available yet
//    @objc(navigateURL:sender:)
//    public func navigate(url: NSURL, sender: UIViewController) {
//    }

    private func navigate(context: NavigationContext) {
        context.traitCollection = UIApplication.sharedApplication().keyWindow!.traitCollection
        context.sourceViewController.navigationContext = context
        context.presenter(self.collection.transitions).show(context, willShow: self.willNavigate)
    }

    public func navigateBack(sender: UIViewController) {
        sender.navigationContext?.presenter(self.collection.transitions).dismiss(sender)
    }
}
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

    private var collection: [NavigationCollection]

    public override init() {
        self.collection = []
    }

    public convenience init(collection: NavigationCollection) {
        self.init()
        self.importCollection(collection)
    }

    public func importCollection(collection: NavigationCollection) {
        self.collection.append(collection)
    }

    @objc(navigate:context:sender:)
    public func navigate(name: String, context: AnyObject, sender: UIViewController) {
        for collection in self.collection {
            if let route = collection.routes[name] {
                self.navigate(route, context: context, sender: sender)

                return
            }
        }
    }

    // URL routing is not available yet
//    @objc(navigateURL:sender:)
//    public func navigate(url: NSURL, sender: UIViewController) {
//    }

    private func navigate(route: Routable, context: AnyObject?, sender: UIViewController) {
        let navContext = NavigationContext(source: sender, route: route, context: context)

        sender.navigationContext = navContext
        navContext.presenter.show(navContext, willShow: self.willNavigate)
    }

    public func navigateBack(sender: UIViewController) {
        sender.navigationContext?.presenter.dismiss(sender)
    }

    public func redirect() {

    }

    public func urlFor(name: String, context: AnyObject) -> String? {
        // 1. retrieve route by name
        // 2. generate url
        return nil
    }
}
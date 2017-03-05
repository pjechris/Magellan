//
//  Router.swift
//  Magellan
//
//  Created by pjechris on 05/03/17.
//  Copyright © 2017 Akane. All rights reserved.
//

import Foundation

public protocol Router {
    @discardableResult
    func navigate(to context: Any) -> PresentingContext?

    @discardableResult
    func navigate(to context: Any, control: UIControl) -> PresentingContext?

    func navigateBack()

    func navigationTerminated(status: PresentingContext.TerminateStatus)
}

//
//  UniversityDetailsRouter.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import UIKit

public final class UniversityDetailsRouter {
    public weak var viewController: UIViewController?
    
    public init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
}

extension UniversityDetailsRouter: UniversityDetailsRouterProtocol {}

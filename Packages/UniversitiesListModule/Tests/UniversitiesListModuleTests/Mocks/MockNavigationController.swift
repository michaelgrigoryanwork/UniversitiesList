//
//  MockNavigationController.swift
//  UniversitiesListModule
//
//  Created by Michael Grigoryan on 12.06.26.
//

import UIKit

final class MockNavigationController: UINavigationController {
    var capturedPushedViewController: UIViewController?
    var capturedPresentedViewController: UIViewController?

    var didCallPushViewController = false
    var didCallPresentViewController = false
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.capturedPushedViewController = viewController
        self.didCallPushViewController = true
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        self.capturedPresentedViewController = viewControllerToPresent
        self.didCallPresentViewController = true
    }
}

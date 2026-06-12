//
//  MockNavigationController.swift
//  UniversitiesListModule
//
//  Created by Michael Grigoryan on 12.06.26.
//

import UIKit

final class MockNavigationController: UINavigationController {
    var capturedPushedViewController: UIViewController?
    var didCallPushViewController = false
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.capturedPushedViewController = viewController
        self.didCallPushViewController = true
        
        // We do NOT call super.pushViewController to avoid triggering actual UI changes during tests
    }
    
    // You can also add presentation capture if your router presents modals:
    var capturedPresentedViewController: UIViewController?
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        self.capturedPresentedViewController = viewControllerToPresent
    }
}

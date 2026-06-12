//
//  SceneDelegate.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 10.06.26.
//

import UIKit
import NetworkKit
import PersistenceKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    private let appContainer = AppDIContainer()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window

        startApp(in: window)
    }
}

private extension SceneDelegate {
    func startApp(in window: UIWindow) {
        let listViewController = appContainer.makeUniversitiesList()
        let navigationController = UINavigationController(rootViewController: listViewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

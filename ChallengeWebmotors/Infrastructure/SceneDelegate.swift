//
//  SceneDelegate.swift
//  ChallengeWebmotors
//
//  Created by Leonardo Portes on 18/12/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
      
        let window = UIWindow(windowScene: windowScene)
        let controller = VehiclesViewController()
        let navigation = UINavigationController(rootViewController: controller)
        
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        self.window = window
    }

}

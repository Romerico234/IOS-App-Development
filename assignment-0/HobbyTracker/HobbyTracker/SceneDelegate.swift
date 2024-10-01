//
//  SceneDelegate.swift
//  HobbyTracker
//
//  Created by Romerico David on 9/29/24.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Ensure the scene is a UIWindowScene
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Create the SwiftUI view that provides the window contents
        let contentView = ContentView()
        
        // Create the window and set the root view controller to a UIHostingController
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: contentView)
        self.window = window
        window.makeKeyAndVisible()
    }
}

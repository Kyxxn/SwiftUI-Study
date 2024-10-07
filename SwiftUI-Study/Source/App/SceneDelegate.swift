//
//  SceneDelegate.swift
//  SwiftUI-Study
//
//  Created by 박효준 on 10/8/24.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let mainWithSwiftUI = UIHostingController(rootView: SuperView())
        let mainWithUIKit = MainViewController()
        window?.rootViewController = mainWithSwiftUI
        window?.makeKeyAndVisible()
    }
}


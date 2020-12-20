//
//  AppDelegate.swift
//  VitrueHealthTest
//
//  Created by Olivier Conan on 19/12/2020.
//  Copyright © 2020 OlivierConan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // MARK: - Initiate Root
        let viewController = ViewController()

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }

}

//
//  AppDelegate.swift
//  TwitchProject
//
//  Created by Михаил Задорожный on 29.01.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let vc = GameListViewController()
        let vm = GameListViewModel()
        vc.viewModel = vm
        
        let nc = UINavigationController(rootViewController: vc)
        window.rootViewController = nc
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}


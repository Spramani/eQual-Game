//
//  AppDelegate.swift
//  DemoProject_iOS
//
//  Created by Shubham on 22/08/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupCode()
        return true
    }
    
    func setupCode(){
        let vc = HomeVC()
        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
    }

   
}


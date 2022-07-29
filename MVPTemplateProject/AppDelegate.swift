//
//  AppDelegate.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 11/29/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  internal var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    window = UIWindow(frame: UIScreen.main.bounds)
    let mainViewController = MainContainer.resolveViewController()
    window?.rootViewController = mainViewController
    print(Configuration.baseURL)
    window?.makeKeyAndVisible()
    
    return true
  }
  
}


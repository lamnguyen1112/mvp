//
//  AppDelegate.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 11/29/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import UIKit
#if !(APPSTORE)
  import DBDebugToolkit
#endif

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  internal var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    setupDBToolKit()
    setupWindow()
    
    return true
  }
}

extension AppDelegate {
  private func setupWindow() {
    window = UIWindow(frame: UIScreen.main.bounds)
    let mainViewController = MainContainer.resolveViewController()
    window?.rootViewController = mainViewController
    window?.makeKeyAndVisible()
  }
  
  private func setupDBToolKit() {
    #if !(APPSTORE)
      DBDebugToolkit.setup()
    #endif
  }
}

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
import SideMenuSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  internal var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    AppData.token = "Testing Token"
    setupWindow()
    setupDBToolKit()
    
    return true
  }
}

extension AppDelegate {
  private func setupWindow() {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = SideMenuController()
    window?.makeKeyAndVisible()
  }
  
  private func setupDBToolKit() {
    #if !(APPSTORE)
    DBDebugToolkit.setup()
    DBDebugToolkit.setupCrashReporting()
    
    let isUsingMock = UserDefaults.standard.bool(forKey: UserDefaultKey.isUsingMock.rawValue)
    let valUseMock = DBCustomVariable(name: "Using mock", value: isUsingMock)
    valUseMock.addTarget(self, action: #selector(changeUsingMockConfig))
    DBDebugToolkit.add(valUseMock)
    #endif
  }
  
  @objc private func changeUsingMockConfig() {
    #if !(APPSTORE)
    let isUsingMock = UserDefaults.standard.bool(forKey: UserDefaultKey.isUsingMock.rawValue)
    UserDefaults.standard.set(!isUsingMock, forKey: UserDefaultKey.isUsingMock.rawValue)
    #endif
  }
}

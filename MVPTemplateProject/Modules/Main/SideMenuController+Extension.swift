//
//  SideMenuController+Extension.swift
//  MVPTemplateProject
//
//  Created by Lam Nguyen on 8/3/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import Foundation
import SideMenuSwift

extension SideMenuController {
  convenience init() {
    let menuViewController = MenuViewController.instanceFromNibClass()
    let mainViewController = MainContainer.resolveViewController()
    let rootViewController = UINavigationController(rootViewController: mainViewController)
    self.init(contentViewController: rootViewController, menuViewController: menuViewController)
    
    setupSideMenu()
  }
  
  private func setupSideMenu() {
    SideMenuController.preferences.basic.menuWidth = UIScreen.width - 100
    SideMenuController.preferences.basic.direction = .left
    SideMenuController.preferences.basic.enablePanGesture = false
    SideMenuController.preferences.basic.supportedOrientations = .portrait
    SideMenuController.preferences.basic.shouldRespectLanguageDirection = true

  }
}

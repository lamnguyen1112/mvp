//
//  SideMenuController+Extension.swift
//  MVPTemplateProject
//
//  Created by Lam Nguyen on 8/3/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import Foundation
import LNExtensions
import SideMenuSwift

extension SideMenuController {
  convenience init() {
    let menuViewController = MenuViewController.instanceFromNibClass()
    let tabbarViewController = TabBarViewController()
    self.init(contentViewController: tabbarViewController, menuViewController: menuViewController)

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

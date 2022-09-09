//
//  MainContainer.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 12/2/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import LNExtensions
import UIKit

class MainContainer {
  static func resolveViewController() -> MainViewController {
    let viewcontroller = MainViewController.instantiateFromAppStoryboard(appStoryboard: .main)
    let presenter = MainPresenter()
    presenter.viewController = viewcontroller
    viewcontroller.presenter = presenter
    return viewcontroller
  }
}

//
//  AppStoryBoard.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 12/2/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import LNExtensions
import UIKit

enum AppStoryBoard: String {
  case main = "Main"

  var instance: UIStoryboard {
    UIStoryboard(name: rawValue, bundle: Bundle.main)
  }

  func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
    let storyboardId = (viewControllerClass as UIViewController.Type).storyboardID
    if #available(iOS 13.0, *) {
      return instance.instantiateViewController(identifier: storyboardId) as! T
    } else {
      // Fallback on earlier versions
      return instance.instantiateViewController(withIdentifier: storyboardId) as! T
    }
  }
}

// USAGE :
// let storyboard = AppStoryboard.Main.instance

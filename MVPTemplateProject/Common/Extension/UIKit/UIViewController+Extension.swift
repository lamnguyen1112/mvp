//
//  UIViewController+Extension.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 12/2/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import UIKit

extension UIViewController {
  class var storyboardID: String {
    return "\(self)"
  }
  
  static func instantiateFromAppStoryboard(appStoryboard: AppStoryBoard) -> Self {
    appStoryboard.viewController(viewControllerClass: self)
  }
  
  static var classIdentifier: String {
      return String(describing: self)
  }
  
  class func instanceFromNibClass() -> Self {
      return self.init(nibName: self.classIdentifier, bundle: nil)
  }
}

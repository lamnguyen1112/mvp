//
//  Extension++.swift
//  MVPTemplateProject
//
//  Created by Lazyman on 9/8/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
  static func instantiateFromAppStoryboard(appStoryboard: AppStoryBoard) -> Self {
    appStoryboard.viewController(viewControllerClass: self)
  }
}

//
//  BaseView.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 12/2/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol BaseView: AnyObject {
  func showProgress()
  func hideProgress()
}

extension BaseView {
  
  func showProgress() {
    SVProgressHUD.show()
  }
  
  func hideProgress() {
    SVProgressHUD.dismiss()
  }
}

//
//  UITextField+Extension.swift
//  MVPTemplateProject
//
//  Created by Nguyen Tien LAM on 6/4/20.
//  Copyright © 2020 lazyman. All rights reserved.
//

import UIKit

@IBDesignable
extension UITextField {
  @IBInspectable var leftPaddingWidth: CGFloat {
    get {
      return leftView!.frame.size.width
    }
    set {
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
      rightView = paddingView
      leftViewMode = .always
    }
  }
}

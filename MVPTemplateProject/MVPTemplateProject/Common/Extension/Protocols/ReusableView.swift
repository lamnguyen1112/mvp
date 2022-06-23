//
//  ResuaView.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 12/2/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import UIKit

public protocol ReusableView: AnyObject {
  static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
  public static var defaultReuseIdentifier: String {
    return String(describing: self)
  }
}

public protocol NibLoadableView: AnyObject {
  static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
  static var nibName: String {
    return String(describing: self)
  }
}

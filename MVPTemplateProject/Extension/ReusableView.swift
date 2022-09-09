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

public extension ReusableView where Self: UIView {
  static var defaultReuseIdentifier: String {
    String(describing: self)
  }
}

public protocol NibLoadableView: AnyObject {
  static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
  static var nibName: String {
    String(describing: self)
  }
}

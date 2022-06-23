//
//  UITableView+Extension.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 12/2/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import UIKit

// UITableView + Reusable cell
extension UITableView {
  func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
    register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
  }
  
  func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
    let bundle = Bundle(for: T.self)
    let nib = UINib(nibName: T.nibName, bundle: bundle)
    register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
  }
  
  func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView, T: NibLoadableView {
    register(T.self)
    guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
    }
    return cell
  }
  
  func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
    register(T.self)
    guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
    }
    return cell
  }
  
  func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) where T: ReusableView, T: NibLoadableView {
    let bundle = Bundle(for: T.self)
    let nib = UINib(nibName: T.nibName, bundle: bundle)
    register(nib, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
  }
  
  func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: ReusableView {
    register(T.self, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
    guard let cell = dequeueReusableHeaderFooterView(withIdentifier: T.defaultReuseIdentifier) as? T else {
      fatalError("Could not dequeue Reusable HeaderFooterView with identifier: \(T.defaultReuseIdentifier)")
    }
    return cell
  }
}

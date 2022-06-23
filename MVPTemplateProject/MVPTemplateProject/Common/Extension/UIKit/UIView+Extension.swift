//
//  UIView+Extension.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 11/29/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import Foundation
import UIKit

enum ViewBorder: String {
  case left, right, top, bottom
}

extension UIView {
  
  @IBInspectable var bottomLineWidth: CGFloat {
    get {
      return self.bottomLineWidth
    }
    set {
      DispatchQueue.main.async {
        self.addBottomBorderWithColor(color: self.borderColor ?? UIColor.red, width: newValue)
      }
    }
  }
  
  @IBInspectable var topLineWidth: CGFloat {
    get {
      return self.topLineWidth
    }
    set {
      DispatchQueue.main.async {
        self.addTopBorderWithColor(color: self.borderColor ?? UIColor.red, width: newValue)
      }
    }
  }
  
  @IBInspectable var rightLineWidth: CGFloat {
    get {
      return self.rightLineWidth
    }
    set {
      DispatchQueue.main.async {
        self.addRightBorderWithColor(color: self.borderColor ?? UIColor.red, width: newValue)
      }
    }
  }
  
  @IBInspectable var leftLineWidth: CGFloat {
    get {
      return self.leftLineWidth
    }
    set {
      DispatchQueue.main.async {
        self.addLeftBorderWithColor(color: self.borderColor ?? UIColor.red, width: newValue)
      }
    }
  }
  
  func addTopBorderWithColor(color: UIColor, width: CGFloat) {
    removeBorderByTag(100)
    let border = UIView()
    border.backgroundColor = color
    border.tag = 100
    self.addSubview(border)
    self.addConstraintsWithFormat("H:|[v0]|", views: border)
    self.addConstraintsWithFormat("V:|[v0(\(width))]", views: border)
  }
  
  func addRightBorderWithColor(color: UIColor, width: CGFloat) {
    removeBorderByTag(101)
    let border = UIView()
    border.backgroundColor = color
    border.tag = 101
    removeBorderByTag(101)
    self.addSubview(border)
    self.addConstraintsWithFormat("H:[v0(\(width))]|", views: border)
    self.addConstraintsWithFormat("V:|[v0]|", views: border)
  }
  
  func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
    removeBorderByTag(102)
    let border = UIView()
    border.tag = 102
    border.backgroundColor = color
    self.addSubview(border)
    self.addConstraintsWithFormat("H:|[v0]|", views: border)
    self.addConstraintsWithFormat("V:[v0(\(width))]|", views: border)
  }
  
  func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
    removeBorderByTag(103)
    let border = UIView()
    border.tag = 103
    border.backgroundColor = color
    self.addSubview(border)
    self.addConstraintsWithFormat("H:|[v0(\(width))]", views: border)
    self.addConstraintsWithFormat("V:|[v0]|", views: border)
  }
  
  func removeBorderByTag(_ number: Int) {
    for i in subviews where i.tag == number {
      i.removeFromSuperview()
    }
  }
  
  func removePreviouslyAddedLayer(name : String) {
    if self.layer.sublayers?.count ?? 0 > 0 {
      self.layer.sublayers?.forEach {
        if $0.name == name {
          $0.removeFromSuperlayer()
        }
      }
    }
  }
}


@IBDesignable extension UIView {
  
  @IBInspectable var borderColor: UIColor? {
    set {
      layer.borderColor = newValue?.cgColor
    }
    
    get {
      if let color = layer.borderColor {
        return UIColor(cgColor: color)
      } else {
        return nil
      }
    }
  }
  
  @IBInspectable var borderWidth: CGFloat {
    set {
      layer.borderWidth = newValue
    }
    
    get {
      return layer.borderWidth
    }
  }
  
  @IBInspectable var cornerRadius: CGFloat {
    set {
      layer.cornerRadius = newValue
      clipsToBounds = newValue > 0
    }
    get {
      return layer.cornerRadius
    }
  }
  
  @IBInspectable var shadowColor: UIColor? {
    set {
      layer.shadowColor = newValue!.cgColor
    }
    get {
      if let color = layer.shadowColor {
        return UIColor(cgColor: color)
      } else {
        return nil
      }
    }
  }
  
  @IBInspectable var shadowOpacity: Float {
    set {
      layer.shadowOpacity = newValue
    }
    get {
      return layer.shadowOpacity
    }
  }
  @IBInspectable var shadowOffset: CGSize {
    set {
      layer.shadowOffset = newValue
    }
    get {
      return layer.shadowOffset
    }
  }
  @IBInspectable var shadowRadius: CGFloat {
    set {
      layer.shadowRadius = newValue
    }
    get {
      return layer.shadowRadius
    }
  }
}



extension UIView {
  
  func addConstraintsWithFormat(_ format: String, views: UIView...) {
    var viewsDictionary = [String: UIView]()
    for (index, view) in views.enumerated() {
      let key = "v\(index)"
      view.translatesAutoresizingMaskIntoConstraints = false
      viewsDictionary[key] = view
    }
    
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
  }
  
  enum ViewSide {
    case Left, Right, Top, Bottom
  }
  
  func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {
    
    let border = CALayer()
    border.backgroundColor = color
    
    switch side {
    case .Left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height); break
    case .Right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height); break
    case .Top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness); break
    case .Bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness); break
    }
    
    layer.addSublayer(border)
  }
  
  func getConvertedPoint(baseView: UIView?) -> CGPoint {
    var pnt = frame.origin
    guard var superView = superview else {
      return frame.origin
    }
    while superView != baseView {
      pnt = superView.convert(pnt, to: superView.superview)
      if let superV = superView.superview {
        superView = superV
      } else {
        break
      }
    }
    return superView.convert(pnt, to: baseView)
  }
}

// MAKR: - Animation
extension UIView {
  func fadeTransition(_ duration: CFTimeInterval) {
    let animation = CATransition()
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    animation.type = CATransitionType.fade
    animation.duration = duration
    layer.add(animation, forKey: CATransitionType.fade.rawValue)
  }
}

extension UIView: ReusableView {}


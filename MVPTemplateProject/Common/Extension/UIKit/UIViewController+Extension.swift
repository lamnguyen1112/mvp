//
//  UIViewController+Extension.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 12/2/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import UIKit
import SwiftUI

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

extension UIViewController {
  
  /// Add a SwiftUI `View` as a child of the input `UIView`.
  /// - Parameters:
  ///   - swiftUIView: The SwiftUI `View` to add as a child.
  ///   - view: The `UIView` instance to which the view should be added.
  func addSubSwiftUIView<Content>(_ swiftUIView: Content, to view: UIView) where Content : View {
    let hostingController = UIHostingController(rootView: swiftUIView)
    hostingController.navigationController?.isNavigationBarHidden = true
    
    /// Add as a child of the current view controller.
    addChild(hostingController)
    
    /// Add the SwiftUI view to the view controller view hierarchy.
    view.addSubview(hostingController.view)
    
    /// Setup the contraints to update the SwiftUI view boundaries.
    hostingController.view.translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
      hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
      hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
      view.bottomAnchor.constraint(equalTo: hostingController.view.bottomAnchor),
      view.rightAnchor.constraint(equalTo: hostingController.view.rightAnchor)
    ]
    
    NSLayoutConstraint.activate(constraints)
    
    /// Notify the hosting controller that it has been moved to the current view controller.
    hostingController.didMove(toParent: self)
  }
}

//
//  DetailsViewController.swift
//  MVPTemplateProject
//
//  Created by Lazyman on 9/8/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import UIKit
import SwiftUI

class DetailsViewController: UIViewController {
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.isNavigationBarHidden = true
//    self.tabBarController?.tabBar.isHidden = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.isNavigationBarHidden = false
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    inititalNavigationView()
  }
  
  func inititalNavigationView() {
    let headerView = HeaderView()
    let hostingViewController = UIHostingController(rootView: headerView)
    hostingViewController.view.frame = CGRect(x: 0, y: UIDevice.safeAreaInsets.top, width: UIScreen.width, height: 60)
    view.addSubview(hostingViewController.view)
  }
}

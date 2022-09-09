//
//  TabBarViewController.swift
//  MVPTemplateProject
//
//  Created by Lam Nguyen on 8/3/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    setupTabbar()
  }

  private func setupTabbar() {
    let tab1Controller = MainContainer.resolveViewController()
    let rootTab1Controller = UINavigationController(rootViewController: tab1Controller)
    tab1Controller.title = "Tab 1"
//    tab1Controller.tabBarItem = UITabBarItem(title: "Tab 1", image: nil, tag: 1)

    let tab2Controller = MainContainer.resolveViewController()
    let rootTab2Controller = UINavigationController(rootViewController: tab2Controller)
    tab2Controller.title = "Tab 2"
//    tab2Controller.tabBarItem = UITabBarItem(title: "Tab 2", image: nil, tag: 2)

    let tab3Controller = MainContainer.resolveViewController()
    let rootTab3Controller = UINavigationController(rootViewController: tab3Controller)
    tab3Controller.title = "Tab 3"
//    tab3Controller.tabBarItem = UITabBarItem(title: "Tab 3", image: nil, tag: 3)

    let tab4Controller = MainContainer.resolveViewController()
    let rootTab4Controller = UINavigationController(rootViewController: tab4Controller)
    tab4Controller.title = "Tab 4"
//    tab4Controller.tabBarItem = UITabBarItem(title: "Tab 4", image: nil, tag: 4)

    let tab5Controller = MainContainer.resolveViewController()
    let rootTab5Controller = UINavigationController(rootViewController: tab5Controller)
    tab5Controller.title = "Tab 5"
//    tab5Controller.tabBarItem = UITabBarItem(title: "Tab 5", image: nil, tag: 5)

    viewControllers = [rootTab1Controller, rootTab2Controller, rootTab3Controller, rootTab4Controller, rootTab5Controller]
  }
}

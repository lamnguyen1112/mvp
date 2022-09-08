//
//  DetailsViewController.swift
//  MVPTemplateProject
//
//  Created by Lazyman on 9/8/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import UIKit
import SwiftUI
import LNExtensions

class DetailsViewController: UIViewController {
  @IBOutlet weak var topConstraint: NSLayoutConstraint!
  @IBOutlet private weak var tableView: UITableView!
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.isNavigationBarHidden = true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    inititalNavigationView()
    setupTableView()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.isNavigationBarHidden = false
  }
  
  private func inititalNavigationView() {
    let headerView = HeaderView(title: "Details")
    let hostingViewController = UIHostingController(rootView: headerView)
    hostingViewController.view.frame = CGRect(x: 0, y: 0, width: UIScreen.width, height: 60 + UIDevice.safeAreaInsets.top)
    hostingViewController.view.backgroundColor = UIColor.red
    view.addSubview(hostingViewController.view)
  }
  
  private func setupTableView() {
    topConstraint.constant = 60 + UIDevice.safeAreaInsets.top
//    tableView.backgroundColor = R.color.background()
    tableView.register(UIHostingCell<CellView>.self)
    tableView.dataSource = self
    tableView.delegate = self
  }
}

extension DetailsViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: UIHostingCell<CellView>.reuseIdentifier, for: indexPath) as! UIHostingCell<CellView>
    cell.configure(CellView())
    cell.selectionStyle = .none
    
    return cell
  }
}

extension DetailsViewController: UITableViewDelegate {
  
}

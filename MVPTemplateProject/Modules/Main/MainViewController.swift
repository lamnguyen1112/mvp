//
//  MainViewController.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 12/2/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import UIKit
import SideMenuSwift

protocol MainProtocol: BaseView {
  func requestError(_ msg: String, titleAlert: String?)
  func reloadListUser(_ users: [User]?)
}

class MainViewController: BaseViewController {
  
  // MARK: - Outlets
  @IBOutlet private weak var tableView: UITableView!
  
  // MARK: - Properties
  var presenter: MainPresenterProtocol?
  var users: [User]?
  
  // MARK: - Define
  private enum MainViewControllerSection: Int, CaseIterable {
    case titleSection
    case users
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    presenter?.getUsers()
    if let token = AppData.token {
      print(token)
    }
  }
}

// MARK: - Setup
extension MainViewController {
  private func setupUI() {
//    title = "Users"
    view.backgroundColor = .white
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu",
                                                             style: .plain,
                                                             target: self,
                                                             action: #selector(rightHandAction))
    configureTableView()
  }
  
  private func configureTableView() {
    tableView.rowHeight = UITableView.automaticDimension
    tableView.dataSource = self
    tableView.delegate = self
//    tableView.separatorColor = .clear
    tableView.showsVerticalScrollIndicator = true
  }
  
  @objc private func rightHandAction() {
    self.sideMenuController?.revealMenu()
  }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return MainViewControllerSection.allCases.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let type = MainViewControllerSection(rawValue: section) else { return 0 }
    
    switch type {
    case .titleSection:
      return 0
    default:
      return users?.count ?? 0
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let type = MainViewControllerSection(rawValue: indexPath.section) else {
      return UITableViewCell()
    }
    
    switch type {
    case .titleSection:
      return configureTitleSection(tableView, indexPath: indexPath)
    case .users:
      return configureUserSection(tableView, indexPath: indexPath)
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let viewController = UIViewController()
    self.navigationController?.pushViewController(viewController, animated: true)
  }
}

// MARK:- configure Section
extension MainViewController {
  typealias Address = User.Address
  func configureTitleSection(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.defaultReuseIdentifier, for: indexPath) as? TitleTableViewCell else {
      return UITableViewCell()
    }
    cell.selectionStyle = .none
    
    return cell
  }
  
  func configureUserSection(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.defaultReuseIdentifier, for: indexPath) as? UserTableViewCell else {
      return UITableViewCell()
    }
    cell.selectionStyle = .none
    let address = Address()
    let user = users?[indexPath.row]
    cell.setUser(user)
    
    return cell
  }
}

// MARK: -- Protocol
extension MainViewController: MainProtocol {
  func requestError(_ msg: String, titleAlert: String?) {
    
  }
  
  func reloadListUser(_ users: [User]?) {
    self.users = users
    self.tableView.reloadData()
  }

}

//
//  MainViewController.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 12/2/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import UIKit

protocol MainProtocol: BaseView {
  
}

class MainViewController: BaseViewController, MainProtocol {
  // MARK: -- Protocol
  func requestError(_ msg: String, titleAlert: String?) {
    
  }
  
  // MARK: - Outlets
  @IBOutlet private weak var tableView: UITableView!
  
  // MARK: - Properties
  var presenter: MainPresenter?
  private enum MainViewControllerSection: Int, CaseIterable {
    case titleSection
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  // MARK: - Setup
  private func setupUI() {
    view.backgroundColor = .white
    configureTableView()
  }
  
  private func configureTableView() {
    tableView.rowHeight = UITableView.automaticDimension
    tableView.dataSource = self
    tableView.delegate = self
    tableView.separatorColor = .clear
    tableView.showsVerticalScrollIndicator = false
  }
  
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return MainViewControllerSection.allCases.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let type = MainViewControllerSection(rawValue: section) else { return 0 }
    
    switch type {
    default:
      return 10
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let type = MainViewControllerSection(rawValue: indexPath.section) else {
      return UITableViewCell()
    }
    
    switch type {
    case .titleSection:
      return configureTitleSection(tableView, indexPath: indexPath)
    }
  }
}

// MARK:- configure Section
extension MainViewController {
  func configureTitleSection(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.defaultReuseIdentifier, for: indexPath) as? TitleTableViewCell else {
      return UITableViewCell()
    }
    cell.selectionStyle = .none
    
    return cell
  }
}

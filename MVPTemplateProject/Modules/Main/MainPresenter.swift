//
//  MainPresenter.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 12/2/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import UIKit

protocol MainPresenterProtocol {
  
}

class MainPresenter: MainPresenterProtocol {
  
  weak var viewController: MainProtocol?
  
  private let userService = UserService()
  
  func getUsers() {
    userService.getUsers()
  }
  
}

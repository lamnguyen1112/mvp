//
//  MainPresenter.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 12/2/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import UIKit

protocol MainPresenterProtocol {
  func getUsers()
}

class MainPresenter: MainPresenterProtocol {
  
  weak var viewController: MainProtocol?
  private let userService: UserServiceProtocol = UserServiceMock()
  private var userTask: Task<(), Never>?
  
  func getUsers() {
    userTask = Task() {
      let (users, _) = await userService.getUsers()
      
      await MainActor.run(body: {
        self.viewController?.reloadListUser(users)
      })
    }
  }
  
//  func oldVersionGetUsers() {
//      userService.getUsers(completion: { users, error in
//        self.viewController?.reloadListUser(users)
//      })
//  }
  
  deinit {
    userTask?.cancel()
  }
}

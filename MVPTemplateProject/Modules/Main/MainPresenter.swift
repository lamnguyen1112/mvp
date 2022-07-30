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
//    old version
//    userService.getUsers(completion: { users, error in
//      self.viewController?.reloadListUser(users)
//    })
    
//    new version
    Task {
      let (users, _) = await userService.getUsers()
      
      await MainActor.run(body: {
        self.viewController?.reloadListUser(users)
      })
    }
  }
  
}

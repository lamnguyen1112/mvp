//
//  UserService.swift
//  MVPTemplateProject
//
//  Created by Lam Nguyen on 7/30/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import Foundation

struct UserService {
  func getUsers() {
    let router = Router<[User]>()
    let userEndPoint = UserEndPoint.users
    router.request(userEndPoint) { (responseObj, error, status) in
//      completion(responseObj, error)
//      print("test response object", responseObj!)
      print(error?.localizedDescription)
    }
  }
}

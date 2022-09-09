//
//  UserService.swift
//
//  Created by Lam Nguyen on 7/30/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import APlClient
import Foundation

protocol UserServiceProtocol {
  func getUsers() async -> ([User]?, Error?)
}

struct UserService: UserServiceProtocol {
  func getUsers(completion: @escaping (_ users: [User]?, _ error: Error?) -> Void) {
    let router = Router<[User]>()
    let userEndPoint = UserEndPoint.users

    router.request(userEndPoint) { response, error, _ in
      completion(response?.data, error)
    }
  }

  func getUsers() async -> ([User]?, Error?) {
    let router = Router<[User]>()
    let userEndPoint = UserEndPoint.users

    return await withCheckedContinuation { continuation in
      router.request(userEndPoint) { response, error, _ in
        continuation.resume(returning: (response?.data, error))
      }
    }
  }
}

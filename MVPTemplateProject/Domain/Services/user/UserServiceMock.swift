//
//  UserServiceMock.swift
//  MVPTemplateProject
//
//  Created by Lam Nguyen on 7/31/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import APlClient
import Foundation

struct UserServiceMock: UserServiceProtocol {
  func getUsers() async -> ([User]?, Error?) {
    try? await Task.sleep(nanoseconds: 2_000_000_000)

    guard let url = Bundle.main.url(forResource: "UsersMock", withExtension: "json"),
          let data = try? Data(contentsOf: url)
    else {
      return ([], nil)
    }
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let jsonMock = try? decoder.decode(BaseModel<[User]>.self, from: data)
    return (jsonMock?.data, nil)
  }
}

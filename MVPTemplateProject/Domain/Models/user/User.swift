//
//  User.swift
//  MVPTemplateProject
//
//  Created by Lam Nguyen on 7/30/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import Foundation

struct User: Decodable {
  var userId: Int?
  var name: String?
  var address: Address?
}

extension User: CustomDebugStringConvertible {
  var debugDescription: String {
    "\(userId ?? 0) \(name ?? "")"
  }
}

extension User {
  struct Address: Decodable {
    var town: String?
    var number: String?
  }
}

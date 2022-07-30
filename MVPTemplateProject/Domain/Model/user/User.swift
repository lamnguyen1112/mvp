//
//  User.swift
//  MVPTemplateProject
//
//  Created by Lam Nguyen on 7/30/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import Foundation

typealias UserReponseData = BaseModel<[User]>

struct User: Codable {
  var userId: String?
  var name: String?
}


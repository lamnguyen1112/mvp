//
//  BaseModel.swift
//  MVPTemplateProject
//
//  Created by Do Tran on 10/14/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import Foundation

struct BaseModel<T: Decodable>: Decodable {
  var code: Int?
  var msg: String?
  var data: T?
}

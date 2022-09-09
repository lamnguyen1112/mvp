//
//  UserEndPoint.swift
//  MVPTemplateProject
//
//  Created by Lam Nguyen on 7/30/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import Alamofire
import APlClient
import Foundation

enum UserEndPoint {
  case users
}

extension UserEndPoint: EndPointType {
  var baseURL: URL {
    Configuration.baseURL
  }

  var path: String {
    "users"
  }

  var httpMethod: HTTPMethod {
    .get
  }

  var headers: HTTPHeaders? {
    APIHeader.headerWithToken()
  }

  var params: HTTPParameter? {
    nil
  }

  var paramType: ParameterType? {
    nil
  }
}

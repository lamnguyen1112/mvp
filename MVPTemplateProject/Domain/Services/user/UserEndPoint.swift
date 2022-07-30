//
//  UserEndPoint.swift
//  MVPTemplateProject
//
//  Created by Lam Nguyen on 7/30/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import Foundation
import Alamofire

enum UserEndPoint {
  case users
}

extension UserEndPoint: EndPointType {
  var baseURL: URL {
    return URL(string: "http://demo5237716.mockable.io/") ?? Configuration.baseURL
  }
  
  var path: String {
    return "users"
  }
  
  var httpMethod: HTTPMethod {
    return .get
  }
  
  var headers: HTTPHeaders? {
    return APIHeader.headerWithToken()
  }
  
  var params: HTTPParameter? {
    return nil
  }
  
  var paramType: ParameterType? {
    return nil
  }
  
}
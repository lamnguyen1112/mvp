//
//  CampaignApiEndPoint.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 12/2/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import Foundation
import Alamofire

enum CampainEndPointApi {
  case campain(limit: Int, lastKey: String)
}

extension CampainEndPointApi: EndPointType {
  
  var baseURL: URL {
    return Configuration.baseURL
  }
  
  var path: String {
    switch self {
    case .campain( _, _):
      return "/server/v1/campaigns"
    }
  }
  
  var httpMethod: HTTPMethod {
    return .post
  }
  
  var headers: HTTPHeaders? {
    return ApiHeader.headerWithToken()
  }
  
  var params: HTTPParameter? {
    switch self {
    case .campain( _, _):
      return nil
    }
    
  }
  
  var paramType: ParameterType? {
    switch self {
    case .campain(_, _):
      return .body
    }
  }
}

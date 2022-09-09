//
//  CampaignApiEndPoint.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 12/2/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import Alamofire
import APlClient
import Foundation

enum CampainEndPoint {
  case campain(limit: Int, lastKey: String)
}

extension CampainEndPoint: EndPointType {
  var baseURL: URL {
    Configuration.baseURL
  }

  var path: String {
    switch self {
    case .campain:
      return "/server/v1/campaigns"
    }
  }

  var httpMethod: HTTPMethod {
    .post
  }

  var headers: HTTPHeaders? {
    APIHeader.headerWithToken()
  }

  var params: HTTPParameter? {
    switch self {
    case .campain:
      return nil
    }
  }

  var paramType: ParameterType? {
    switch self {
    case .campain:
      return .body
    }
  }
}

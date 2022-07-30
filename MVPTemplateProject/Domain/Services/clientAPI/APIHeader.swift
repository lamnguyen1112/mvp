//
//  APIHeader.swift
//  MVPTemplateProject
//
//  Created by Do Tran on 10/15/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import Foundation
import Alamofire

class APIHeader {
  
  static func normalHeader() -> HTTPHeaders {
    return HTTPHeaders(["version": "\(Ultilities.appVersion())"])
  }
  
  static func headerWithToken() -> HTTPHeaders {
    guard let token = UserDefaultManager.shared.get(.token)
    else { return normalHeader() }
    return HTTPHeaders([
      "version": "\(Ultilities.appVersion())",
      "Authorization": token
    ])
  }
}

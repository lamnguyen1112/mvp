//
//  APIHeader.swift
//  MVPTemplateProject
//
//  Created by Do Tran on 10/15/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import LNExtensions

class APIHeader {
  
  static func normalHeader() -> HTTPHeaders {
    return HTTPHeaders(["version": "\(UIApplication.appVersion)"])
  }
  
  static func headerWithToken() -> HTTPHeaders {
    guard let token = UserDefaultManager.shared.get(.token)
    else { return normalHeader() }
    return HTTPHeaders([
      "version": "\(UIApplication.appVersion)",
      "Authorization": token
    ])
  }
}

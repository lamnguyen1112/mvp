//
//  Connectivity.swift
//  MVPTemplateProject
//
//  Created by Do Tran on 10/18/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
  class var isConnectedToInternet: Bool {
    return NetworkReachabilityManager()?.isReachable ?? false
  }
}

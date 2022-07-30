//
//  Configuration.swift
//  Dev
//
//  Created by Do Tran on 10/15/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import Foundation

enum Configuration: String {
  case dev
  case staging
  case release
  
  static let current: Configuration = {
    guard let rawValue = Bundle.main.infoDictionary?["Configuration"] as? String else {
      fatalError("No Configuration Found")
    }
    
    guard let configuration = Configuration(rawValue: rawValue.lowercased()) else {
      fatalError("Invalid Configuration")
    }
    
    return configuration
  }()
  
  // MARK: - Base URL
  
  static var baseURL: URL {
    switch current {
    case .dev:
      return URL(string: "https://dev.mrlazy.template.com")!
    case .staging:
      return URL(string: "https://staging.mrlazy.template.com")!
    case .release:
      return URL(string: "https://mrlazy.template.com")!
    }
  }
}

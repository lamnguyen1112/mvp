//
//  AppData.swift
//  MVPTemplateProject
//
//  Created by Lam Nguyen on 7/31/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import UIKit

struct AppData {
  @Storage(key: StorageKey.tokenKey, defaultValue: nil)
  static var token: String?
}

extension AppData {
  struct StorageKey {
    static let tokenKey = "Token_Key"
  }
}

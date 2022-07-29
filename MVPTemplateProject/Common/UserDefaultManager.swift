//
//  UserDefaultManager.swift
//  MVPTemplateProject
//
//  Created by Do Tran on 10/15/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import Foundation

enum UserDefaultKey: String {
  case lockLogin = "LOCK_LOGIN"
  case token = "TOKEN"
  case refreshToken = "REFRESH_TOKEN"
  case createRequestMaintain = "CREATE_REQUEST_MAINTAIN"
  case uuid = "UUID"
}

class UserDefaultManager: NSObject {
  static let shared = UserDefaultManager()
  private override init() { }
  
  func saveTimeLockedLogin(time: Double) {
    saveDouble(.lockLogin, value: time)
  }
  
  func getTimeLockedLogin() -> Double? {
    return getDouble(.lockLogin)
  }
  
  func save(_ type: UserDefaultKey, value: String) {
    UserDefaults.standard.set(value, forKey: type.rawValue)
    UserDefaults.standard.synchronize()
  }
  
  func get(_ type: UserDefaultKey) -> String? {
    return UserDefaults.standard.string(forKey: type.rawValue)
  }
  
  func saveDouble(_ type: UserDefaultKey, value: Double) {
    UserDefaults.standard.set(value, forKey: type.rawValue)
    UserDefaults.standard.synchronize()
  }
  
  func saveInt(_ type: UserDefaultKey, value: Int) {
    UserDefaults.standard.set(value, forKey: type.rawValue)
    UserDefaults.standard.synchronize()
  }
  
  func getInt(_ type: UserDefaultKey) -> Int? {
    return UserDefaults.standard.integer(forKey: type.rawValue)
  }
  
  func getDouble(_ type: UserDefaultKey) -> Double? {
    return UserDefaults.standard.double(forKey: type.rawValue)
  }
  
  func saveData(_ type: UserDefaultKey, value: Data) {
    UserDefaults.standard.set(value, forKey: type.rawValue)
    UserDefaults.standard.synchronize()
  }
  
  func getData(_ type: UserDefaultKey) -> Data? {
    return UserDefaults.standard.data(forKey: type.rawValue)
  }
  
  func delete(_ type: UserDefaultKey) {
    UserDefaults.standard.removeObject(forKey: type.rawValue)
  }
}

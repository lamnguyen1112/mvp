//
//  Error+Extension.swift
//  MVPTemplateProject
//
//  Created by Nguyen Tien LAM on 6/4/20.
//  Copyright © 2020 lazyman. All rights reserved.
//

import Foundation

// Define Error
enum UserError: Error {
  case credentialsNotMatch
  case invalidEmail
  case invalidName
}

extension UserError: LocalizedError {
  public var errorDescription: String? {
    switch self {
    case .credentialsNotMatch:
      return NSLocalizedString("Your username and/or password do not match", comment: "Credentials do not match")
    case .invalidEmail:
      return NSLocalizedString("Please enter email address in format: yourname@example.com", comment: "Invalid email format")
    case .invalidName:
      return NSLocalizedString("Please enter you name", comment: "Name field is blank")
    }
  }
}

// use
// let error = UserError.invalidName.errorDescription

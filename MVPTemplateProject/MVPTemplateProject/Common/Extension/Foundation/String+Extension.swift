//
//  String+Extension.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 11/29/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import Foundation


extension String {
  func validUserName() -> (result: Bool, error: String) {
    if self.isEmpty {
      return (false, "empty")
    }
    
    let FULLNAME_REGEX = "^[ア-ヲ 0-9a-zA-Z]{2,30}$"
    let fullnameTest = NSPredicate(format: "SELF MATCHES %@", FULLNAME_REGEX)
    let result =  fullnameTest.evaluate(with: self)
    
    if result == false {
      return (false, "wrong")
    }
    return (true, "")
  }
  
  func htmlAttributedString(with fontName: String, fontSize: Int, colorHex: String) -> NSAttributedString? {
    do {
      let cssPrefix = "<style>* { font-family: \(fontName); color: #\(colorHex); font-size: \(fontSize); }</style>"
      let html = cssPrefix + self
      guard let data = html.data(using: String.Encoding.utf8) else {  return nil }
      return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
    } catch {
      return nil
    }
  }
}

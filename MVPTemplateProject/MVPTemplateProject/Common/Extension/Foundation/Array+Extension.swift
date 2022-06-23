//
//  Array+Extension.swift
//  MVPTemplateProject
//
//  Created by Nguyen Tien LAM on 6/4/20.
//  Copyright © 2020 lazyman. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
  mutating func remove (_ object: Element) {
    if let index = firstIndex(of: object) {
      remove(at: index)
    }
  }
}

//
//  CampaignApiInfo.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 12/2/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import Foundation

enum CampaignType: String {
  case webview
  case browser
  case none
}

typealias CampaignModel = BaseModel<[CampaignInfo]>

struct CampaignInfo: Decodable {
  var id: Int?
  var campaignName: String?
  var transitionType: String?
  var url: String?
  var bannerUrl: String?
  var startDate: String?
  var target: String?
  var endDate: String?
  var isImage: Bool? {
    get {
      if let empty = bannerUrl?.trimmingCharacters(in: .whitespaces).isEmpty {
        if empty {
          return false
        }
        
        return true
      }
      
      return false
    }
  }
  
  var type: CampaignType? {
    get {
      guard let typeStr = transitionType?.lowercased() ,
            let typ = CampaignType(rawValue: typeStr) else { return CampaignType.none }
      return typ
    }
  }
}

//
//  CampaignAPIManager.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 12/2/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import APlClient
import Foundation

protocol CampainServiceProtocol {
  func campain(_ limit: Int,
               lastKey: String,
               completion: @escaping (_ obj: [CampaignInfo]?, _ error: Error?) -> Void)
}

struct CampainService: CampainServiceProtocol {
  func campain(_ limit: Int,
               lastKey: String,
               completion: @escaping (_ obj: [CampaignInfo]?, _ error: Error?) -> Void)
  {
    let router = Router<[CampaignInfo]>()
    let campainAPI = CampainEndPoint.campain(limit: limit, lastKey: lastKey)
    router.request(campainAPI) { responseObj, error, _ in
      completion(responseObj?.data, error)
    }
  }
}

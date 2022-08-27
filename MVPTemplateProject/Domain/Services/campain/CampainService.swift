//
//  CampaignAPIManager.swift
//  MVPTemplateProject
//
//  Created by LAM NGUYEN on 12/2/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import Foundation
import APlClient

protocol CampainServiceProtocol {
  func campain(_ limit: Int,
               lastKey: String,
               completion: @escaping (_ obj: [CampaignInfo]?, _ error: Error?) -> ())
}

struct CampainService: CampainServiceProtocol {
  func campain(_ limit: Int,
               lastKey: String,
               completion: @escaping (_ obj: [CampaignInfo]?, _ error: Error?) -> ()) {
    let router = Router<[CampaignInfo]>()
    let campainAPI = CampainEndPoint.campain(limit: limit, lastKey: lastKey)
    router.request(campainAPI) { (responseObj, error, status) in
      completion(responseObj?.data, error)
    }
  }
}

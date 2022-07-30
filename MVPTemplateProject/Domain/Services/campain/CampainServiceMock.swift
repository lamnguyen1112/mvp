//
//  CampainServiceMock.swift
//  MVPTemplateProject
//
//  Created by Lam Nguyen on 7/30/22.
//  Copyright © 2022 lazyman. All rights reserved.
//

import Foundation

//class CampainServiceMock: CampainServiceProtocol {
//  func campain(_ limit: Int, lastKey: String, completion: @escaping (CampaignModel?, Error?) -> ()) {
//    guard let url = Bundle.main.url(forResource: "AnimalsMock", withExtension: "json"),
//      let data = try? Data(contentsOf: url) else { return }
//    let decoder = JSONDecoder()
//    decoder.keyDecodingStrategy = .convertFromSnakeCase
//    let jsonMock = try? decoder.decode(CampaignInfo.self, from: data)
//    let error = Error()
//    completion(jsonMock, )
//  }
//
//}

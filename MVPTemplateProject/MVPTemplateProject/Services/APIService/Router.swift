//
//  Router.swift
//  MVPTemplateProject
//
//  Created by Do Tran on 10/15/19.
//  Copyright © 2019 lazyman. All rights reserved.
//

import Alamofire

enum Result {
  case success
  case authenticationError
  case refreshToken
  case failure
  case lockedLogin
  case reCall
}

enum ParameterType {
  case uri
  case query
  case body
}

class Router<T: Decodable> {
  private let errorDomain = "com.domain.app"
  
  func request(_ route: EndPointType, completion: @escaping (BaseModel<T>?, Error?, Result) -> ()) {
    let parameters = route.params
    let paramType = route.paramType
    var absolutePath = route.baseURL.appendingPathComponent(route.path).absoluteString
    switch paramType {
    case .uri:
      parameters?.forEach({ _, value in
        absolutePath += "/\(value)"
      })
    default:
      break
    }
    if !Connectivity.isConnectedToInternet {
      let noInternet = NSError(domain: errorDomain,
                                code: URLError.notConnectedToInternet.rawValue,
                                userInfo: [NSLocalizedDescriptionKey: ErrorMessage.MSG_CONNECTION_ERR])
      completion(nil, noInternet, .failure)
      return
    }
    AF.request(absolutePath,
               method: route.httpMethod,
               parameters: parameters ?? nil,
               encoding: paramType == .body ? JSONEncoding.default : URLEncoding.default,
               headers: route.headers ?? ApiHeader.normalHeader()).responseData { (response) in
      NetworkLogger.log(request: response.request!)
      if let error = response.error {
        if let err = error as? URLError, err.code == URLError.notConnectedToInternet {
          let notInternet = NSError(domain: ErrorMessage.TITLE_CONNECTION_ERR, code: err.code.rawValue, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.MSG_CONNECTION_ERR])
          completion(nil, notInternet, .failure)
          return
        }
        let servelError = NSError(domain: ErrorMessage.TITLE_ERROR, code: (error as NSError).code, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.MSG_SERVER_ERR])
        completion(nil, servelError, .failure)
        return
      }
      if let data = response.data,
         let _ = String(data: data, encoding: String.Encoding.utf8) {
        do {
          var obj = try JSONDecoder().decode(BaseModel<T>.self, from: data)
          obj.statusCode = response.response?.statusCode
          let status = self.apiResponse(obj.statusCode)
          completion(obj, nil, status)
          
        } catch let error as NSError {
          print(error)
          let servelError = NSError(domain: ErrorMessage.TITLE_ERROR, code: (error as NSError).code, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.MSG_SERVER_ERR])
          completion(nil, servelError, .failure)
        }
      } else {
        let error = NSError(domain: self.errorDomain, code: 1212, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.MSG_SERVER_ERR])
        completion(nil, error, .failure)
        return
      }
    }
  }
  
  func upload(_ route: EndPointType, file: Data, completion: @escaping (Result, Error?) -> ()) {
    if !Connectivity.isConnectedToInternet {
      let notInternet = NSError(domain: errorDomain,
                                code: URLError.notConnectedToInternet.rawValue,
                                userInfo: [NSLocalizedDescriptionKey: ErrorMessage.MSG_CONNECTION_ERR])
      completion(.failure, notInternet)
      return
    }
    
    /*
     AF.upload(file, to: route.path, method: route.httpMethod, headers: route.headers).responseData(queue: .global()) { (response) in
     if let error = response.error {
     print(error)
     if let err = error as? URLError, err.code == URLError.notConnectedToInternet {
     let notInternet = NSError(domain: "Custom",
     code: err.code.rawValue,
     userInfo: [NSLocalizedDescriptionKey: ErrorMessage.MSG_CONNECTION_ERR])
     completion(.failure, notInternet)
     return
     }
     let servelError = NSError(domain: "Custom",
     code: (error as NSError).code,
     userInfo: [NSLocalizedDescriptionKey: ErrorMessage.MSG_SERVER_ERR])
     completion(.failure, servelError)
     return
     }
     
     if let statusCode = response.response?.statusCode {
     print(statusCode)
     switch statusCode {
     case 200...299:
     completion(.success, nil)
     default:
     completion(.failure, nil)
     }
     } else {
     let servelError = NSError(domain: "Custom",
     code: 1212,
     userInfo: [NSLocalizedDescriptionKey: ErrorMessage.MSG_SERVER_ERR])
     completion(.failure, servelError)
     return
     }
     }
     */
  }
  
  private func apiResponse(_ statusCode: Int?) -> Result {
    switch statusCode ?? 0 {
    case 200...299: return .success
    case 403: return .authenticationError
    case 401: return .refreshToken
    case 429: return .lockedLogin
    default:
      return .failure
    }
  }
}


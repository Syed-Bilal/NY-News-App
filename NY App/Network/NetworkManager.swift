//
//  NetworkManager.swift
//  NY App
//
//  Created by Syed Bilal on 03/08/2024.
//

import Foundation
import Alamofire

enum ApiCompletionStatus {
    case SUCCESS, ERROR, FAILED
}

typealias completion<T: Decodable> = (_ status: ApiCompletionStatus, _ response: T?, _ error: Error?) -> Void

enum ApiControllerBaseUrl {
    
    case mostPopular
    
    var baseUrl: String {
        switch self {
        case .mostPopular:
            return "\(BASE_URL)\(MOST_POPULAR)"
        }
    }
}


class NetworkManager: NSObject {
    
    static let instance = NetworkManager()
    
    private var sessionManager: Alamofire.Session = {

        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30 // Set request timeout interval
        configuration.timeoutIntervalForResource = 60 // Set resource timeout interval
        configuration.httpAdditionalHeaders = HTTPHeaders.default.dictionary
        
        return Alamofire.Session(configuration: configuration)
    }()
    
    
    // MARK: ApiRequest Method
    func ApiRequest<T: Decodable>(baseUrl: ApiControllerBaseUrl, endpoint: BaseApiConfiguration, method: HTTPMethod, encoding: ParameterEncoding, params: Parameters?, completion: @escaping (T?, Error?) -> Void) {
        
        if (!CheckNetworkReachability.instance.isInternetAvailable) {
            let error = NSError(domain: "", code: 101, userInfo: [ NSLocalizedDescriptionKey: "Please check your internet connection"])
            completion(nil, error)
        } else {
            
            let url = baseUrl.baseUrl + endpoint.path
            
            print("API URL {\(method.rawValue.uppercased()) Method} 😎 : \(url)")
            print("Input Parameters : \(String(describing: params))")
            
            let cacher = ResponseCacher(behavior: .cache)
            
            self.sessionManager.request(url, method: method, parameters: params, encoding: encoding)
                .cacheResponse(using: cacher)
                .response(completionHandler: { response in
                    
                    print("\(endpoint.path) > Status Code : \(response.response?.statusCode ?? 404)")
                    switch response.result {
                    case .success(let data):
                        
                        if response.response?.statusCode != 200 {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            if let data = data, let errorMessage = String(data: data, encoding: .utf8) {
                                print("\(endpoint.path) > Error 🤯 : \(errorMessage)")
                                let error = NSError(domain: "", code: response.response?.statusCode ?? 404, userInfo: [ NSLocalizedDescriptionKey: errorMessage])
                                completion(nil, error)
                            }
                        
                            print("\(endpoint.path) > Error 🤯 : \(ERROR_MESSAGE)")
                            let error = NSError(domain: "", code: 404, userInfo: [ NSLocalizedDescriptionKey: ERROR_MESSAGE])
                            completion(nil, error)
                        }
                        
                        do {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            if let data = data {
//                                let stringData = String(data: data, encoding: .utf8)
                                
                                let responseData = try decoder.decode(T.self, from: data)
                                print("\(endpoint.path) > Response 😀 : \(responseData)")
                                completion(responseData, nil)
                            }
                        } catch {
                            print("\(endpoint.path) > Error 🤯 : \(error.localizedDescription)")
                            completion(nil, error)
                        }
                    case .failure(let error):
                        print("\(endpoint.path) > Error 🤯 : \(error.localizedDescription)")
                        completion(nil, error)
                    }
                })
            
//                .responseDecodable(of: T.self) { response in
//                    
//                    if let error = response.error {
//                        print("\(endpoint.path) > Error 🤯 : \(error.localizedDescription)")
//                        completion(nil, error)
//                    } else {
//                        guard let responseData = response.value else {
//                            print("\(endpoint.path) > Error 🤯 : Something went wrong")
//                            return completion(nil, response.error)
//                        }
//                        
//                        print("\(endpoint.path) > Response 😀 : \(responseData)")
//                        completion(responseData, response.error)
//                    }
//                }
        }
        
    }
}


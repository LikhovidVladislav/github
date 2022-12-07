//
//  NetworkManager.swift
//  githubSquare
//
//  Created by admin on 16.09.2022.
//

import Foundation
import Moya

protocol NetworkManager: AnyObject {
    func request<D: Decodable, T: TargetType>(service: T, completion: @escaping ((D?, MapError?) -> Void))
    var jsonDecoder: JSONDecoder { get set }
    
}

struct MapError: Error {
    enum MapErrorType {
        case unknownRedirect
        case clientError
        case serverError
        case undefinedError
        case incorrectParams
        case requestError
    }

    var message: String?
    let type: MapErrorType
    var statusCode: Int?
    
    public var localizedDescription: String {
        if let message = message {
            return message
        } else {
            switch type {
            case .unknownRedirect:
                return "Unknown redirect Error"

            case .clientError:
                return "Unknown client Error"

            case .serverError:
                return "Unknown server Error"
                
            case .incorrectParams:
                return "Incorrect response parameters"

            case .undefinedError:
                return "Unknown Error"
                
            case .requestError:
                return "Connection was lost or server unavailable"
            }
        }
    }
}

class NetworkManagerImpl: NetworkManager {
    
    var jsonDecoder: JSONDecoder
    
    init(jsonDecoder: JSONDecoder) {
        self.jsonDecoder = jsonDecoder
    }
    
    func request<D: Decodable, T: TargetType>(service: T, completion: @escaping ((D?, MapError?) -> Void)) {
        let provider = MoyaProvider<T>(plugins: [NetworkLoggerPlugin()])
        provider.request(service) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode

                switch statusCode {
                case 200 ... 299:
                    do {
                        let response = try self.jsonDecoder.decode(D.self, from: data)
                        
                        completion(response, nil)
                        
                    } catch let error {
                        completion(nil, MapError(message: error.localizedDescription, type: .incorrectParams))
                        
                    }
                case 300 ... 399:
                    completion(nil, MapError(message: nil, type: .unknownRedirect))
                    
                case 400 ... 499:
                    completion(nil, MapError(message: nil, type: .clientError))
                    
                case 500 ... 599:
                    completion(nil, MapError(message: nil, type: .serverError))
                    
                default:
                    completion(nil, MapError(message: nil, type: .undefinedError, statusCode: statusCode))
                }
                
                
            case let .failure(error):
                completion(nil, MapError(message: error.localizedDescription, type: .requestError))
            }
        }
    }
}

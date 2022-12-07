//
//  SquareReposService.swift
//  githubSquare
//
//  Created by admin on 16.09.2022.
//

import Foundation
import Moya

enum SquareReposService {
    case getRepos
}

extension SquareReposService: TargetType {
    var baseURL: URL {
        URL(string: ApiConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .getRepos:
            return "/square/repos"
        }
    }
    
    var method: Moya.Method {
        switch self {
            
        case .getRepos:
            return .get
        }
    }
    
    var task: Task {
        switch self {
            
        case .getRepos:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json", "Accept": "application/json"]
    }
}

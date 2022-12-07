//
//  ErrorBoundaryModel.swift
//  githubSquare
//
//  Created by admin on 16.09.2022.
//

import Foundation

struct ErrorBoundaryModel {
    
    struct Response {
        
        var errorMessage: String?
        
        struct ViewModel {
            enum ErrorType {
                // Here we can specify how to show error
                case alert
                case someCustom
            }
            var errorType: ErrorType
            var errorMessage: String
        }
    }
}

//
//  DetailRepoBoundaryModels.swift
//  githubSquare
//
//  Created by admin on 16.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

/**
    Structures that View Controller, Interactor and Presenter pass over boundary interfaces from one to other.
 */
struct DetailRepo {
    struct Request {
        
        
    }
    struct Response {
        let id: Int
        let fullName: String?
        let description: String?
        let starsCount: Int?
        let lastUpdateDate: Date?
        
        struct ViewModel {
            let items: [Item]
            
            struct Item {
                let title: String
                let description: String
            }
        }
    }
}

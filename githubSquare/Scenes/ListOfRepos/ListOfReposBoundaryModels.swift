//
//  ListOfReposBoundaryModels.swift
//  githubSquare
//
//  Created by admin on 16.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

/**
    Structures that View Controller, Interactor and Presenter pass over boundary interfaces from one to other.
 */
struct ListOfRepos {
    struct Request {
        
        
    }
    struct Response: Equatable {
        var repos: [Item]
        struct Item: Equatable {
            let id: Int
            let name: String?
            let description: String?
        }
        struct ViewModel: Equatable {
            var repos: [Item]
            struct Item: Equatable {
                let id: Int
                let name: String
                let description: String
            }
        }
    }
    
    
}

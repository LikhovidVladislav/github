//
//  ListOfReposInteractor.swift
//  githubSquare
//
//  Created by admin on 16.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Boundary protocols
protocol ListOfReposInteractorInput: AnyObject {
    func loadData()
}

protocol ListOfReposInteractorOutput: AnyObject {
    func presentData(_ response: ListOfRepos.Response)
    func presentLoader(isPresenting: Bool)
    func presentError(_ response: ErrorBoundaryModel.Response)
}

protocol ListOfReposDataStore {
    var data: [SquareReposAPIModel] {get set}
}

// MARK: - Class
/**
    Class to <#business#>.
 */
class ListOfReposInteractor: ListOfReposDataStore {
    var output: ListOfReposInteractorOutput!
    
    var data: [SquareReposAPIModel] = []
    
    var networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
}

//MARK: - ListOfReposInteractorInput
extension ListOfReposInteractor: ListOfReposInteractorInput {
    
    // MARK: Business logic
    
    func loadData() {
        output.presentLoader(isPresenting: true)
        
        let service = SquareReposService.getRepos
        networkManager.request(service: service) { [weak self] (response: [SquareReposAPIModel]?, error) in
            guard let self = self else { return }
            
            // Upadte layout on main thread
            DispatchQueue.main.async {
                self.output.presentLoader(isPresenting: false)
                guard let response = response else {
                    if let error = error {
                        self.output.presentError(ErrorBoundaryModel.Response(errorMessage: error.message))
                    }
                    return
                }
                // Storing data in data source
                self.data = response
                
                let repos = response.map { ListOfRepos.Response.Item(id: $0.id, name: $0.name, description: $0.description) }
                self.output.presentData(ListOfRepos.Response(repos: repos))
            }
            
        }
    }
    
    
}

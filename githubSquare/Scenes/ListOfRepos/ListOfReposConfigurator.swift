//
//  ListOfReposConfigurator.swift
//  githubSquare
//
//  Created by admin on 16.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MSRK: - Class
/**
    Class to build view controller's dependency tree. Makes and links ViewController, Interactor, and Presenter objects.
 */
class ListOfReposConfigurator {
    
    static func inject(dependenciesFor viewController: ListOfReposViewController) {
        if viewController.output != nil {
            return
        }
        
        let router = ListOfReposRouter()
        router.viewController = viewController
        viewController.router = router
        
        let presenter = ListOfReposPresenter()
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let networkManager = NetworkManagerImpl(jsonDecoder: jsonDecoder)
        
        let interactor = ListOfReposInteractor(networkManager: networkManager)
        viewController.output = interactor
        interactor.output = presenter
        presenter.output = viewController
        router.dataStore = interactor
    }
    
    
}

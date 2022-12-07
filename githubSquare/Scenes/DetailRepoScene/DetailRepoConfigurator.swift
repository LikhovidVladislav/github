//
//  DetailRepoConfigurator.swift
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
class DetailRepoConfigurator {
    
    static func inject(dependenciesFor viewController: DetailRepoViewController) {
        if viewController.output != nil {
            return
        }
        
        let router = DetailRepoRouter()
        router.viewController = viewController
        viewController.router = router
        
        let presenter = DetailRepoPresenter()
        let interactor = DetailRepoInteractor()
        viewController.output = interactor
        interactor.output = presenter
        presenter.output = viewController
        router.dataStore = interactor
    }
    
    
}

//
//  ListOfReposRouter.swift
//  githubSquare
//
//  Created by admin on 16.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

////MARK: - Boundary protocols
protocol ListOfReposDataPassing {
    var dataStore: ListOfReposDataStore? {get set}
}

//// MARK: - Class
///**
//    Class to route to new view controller when it's needed to display something that current view controller is not responsible for.
// */
class ListOfReposRouter: NSObject, ListOfReposDataPassing {
    weak var viewController: ListOfReposViewController?
    var dataStore: ListOfReposDataStore?
    
    func goToDetailRepoScene(repoId: Int) {
        let storyboard = UIStoryboard.storyboards.main.initiate()
        let detailRepoViewController: DetailRepoViewController = storyboard.initiateViewControllerFromType()
        detailRepoViewController.router.dataStore?.data = dataStore?.data.first(where: { $0.id == repoId })
        viewController?.navigationController?.pushViewController(detailRepoViewController, animated: true)
    }
}

//
//  DetailRepoRouter.swift
//  githubSquare
//
//  Created by admin on 16.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Boundary protocols
protocol DetailRepoDataPassing {
    var dataStore: DetailRepoDataStore? {get set}
}

// MARK: - Class
/**
    Class to route to new view controller when it's needed to display something that current view controller is not responsible for.
 */
class DetailRepoRouter: NSObject, DetailRepoDataPassing {
    weak var viewController: DetailRepoViewController?
    var dataStore: DetailRepoDataStore?
    
    // MARK: Manual navigation
    @objc func goToSomewhereViewController(segue: UIStoryboardSegue?) {
        //        let destinationVC = segue?.destination as! SomewhereViewController
        //        var destinationDS = destinationVC.router!.dataStore!
        //        self.passDataToGifs(source: dataStore!, destination: &destinationDS)
    }
    
//    @objc func navigateToSomewhere() {
        // NOTE: Teach the router how to navigate to another scene. Some examples follow:
        
        // 1. Trigger a storyboard segue
        // viewController?.performSegue(withIdentifier: "ShowSomewhereScene", sender: nil)
        
        // 2. Present another view controller programmatically
        // viewController?.present(someWhereViewController, animated: true, completion: nil)
        
        // 3. Ask the navigation controller to push another view controller onto the stack
        // viewController?.navigationController?.pushViewController(someWhereViewController, animated: true)
        
        // 4. Present a view controller from a different storyboard
        // let storyboard = UIStoryboard(name: "OtherThanMain", bundle: nil)
        // let someWhereViewController = storyboard.instantiateInitialViewController() as! SomeWhereViewController
        // viewController?.navigationController?.pushViewController(someWhereViewController, animated: true)
//    }
    
    
}

//MARK: - private section
fileprivate extension DetailRepoRouter {
    //   MARK: Passing data
//    func passDataToDestination(source: DetailRepoDataStore, destination: inout DestinationDataStore){
//        destination.data = source.data
//    }
    
    
}

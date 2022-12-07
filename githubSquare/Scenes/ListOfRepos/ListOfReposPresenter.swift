//
//  ListOfReposPresenter.swift
//  githubSquare
//
//  Created by admin on 16.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Boundary protocol
protocol ListOfReposPresenterOutput: AnyObject {
    func displayData(_ viewModel: ListOfRepos.Response.ViewModel)
    func displayError(_ viewModel: ErrorBoundaryModel.Response.ViewModel)
    func displayLoader(isDisplaying: Bool)
}

// MARK: - Class
/**
    Class to format the data response from the Interactor and pass the result view model to the View Controller
 */
class ListOfReposPresenter {
    weak var output: ListOfReposPresenterOutput?
    
}

//MARK: - ListOfReposInteractorOutput
extension ListOfReposPresenter: ListOfReposInteractorOutput {
    
    // MARK: Presentation logic
    
    func presentData(_ response: ListOfRepos.Response) {
        let viewModelRepos = response.repos.map({ ListOfRepos.Response.ViewModel.Item(id: $0.id, name: $0.name ?? "", description: $0.description ?? "There is no description")})
        output?.displayData(ListOfRepos.Response.ViewModel(repos: viewModelRepos))
    }
    
    func presentError(_ response: ErrorBoundaryModel.Response) {
        output?.displayError(ErrorBoundaryModel.Response.ViewModel(errorType: .alert, errorMessage: response.errorMessage ?? "Unexapted error"))
    }
    
    func presentLoader(isPresenting: Bool) {
        output?.displayLoader(isDisplaying: isPresenting)
    }
}

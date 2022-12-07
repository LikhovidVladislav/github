//
//  DetailRepoPresenter.swift
//  githubSquare
//
//  Created by admin on 16.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Boundary protocol
protocol DetailRepoPresenterOutput: AnyObject {
    func dispalayDetalRepo(_ viewModel: DetailRepo.Response.ViewModel)
    func displayError(_ viewModel: ErrorBoundaryModel.Response.ViewModel)
}

// MARK: - Class
/**
    Class to format the data response from the Interactor and pass the result view model to the View Controller
 */
class DetailRepoPresenter {
    weak var output: DetailRepoPresenterOutput?
    
}

//MARK: - DetailRepoInteractorOutput
extension DetailRepoPresenter: DetailRepoInteractorOutput {
    
    // MARK: Presentation logic

    func presentDetailRepo(_ response: DetailRepo.Response) {
        let items = [
            DetailRepo.Response.ViewModel.Item(title: "Full name", description: response.fullName ?? "No name"),
            DetailRepo.Response.ViewModel.Item(title: "Description", description: response.description ?? "No description"),
            DetailRepo.Response.ViewModel.Item(title: "Stars", description: "\(response.starsCount ?? 0)"),
            DetailRepo.Response.ViewModel.Item(title: "Last Update", description: response.lastUpdateDate?.formatted() ?? "No data")
        ]
        output?.dispalayDetalRepo(DetailRepo.Response.ViewModel(items: items))
    }
    
    func presentError(_ response: ErrorBoundaryModel.Response) {
        output?.displayError(ErrorBoundaryModel.Response.ViewModel(errorType: .alert, errorMessage: response.errorMessage ?? "Unexpected error"))
    }
    
    
    
}

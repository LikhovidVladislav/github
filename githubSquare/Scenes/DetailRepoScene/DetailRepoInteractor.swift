//
//  DetailRepoInteractor.swift
//  githubSquare
//
//  Created by admin on 16.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: - Boundary protocols
protocol DetailRepoInteractorInput {
    func loadData()
}

protocol DetailRepoInteractorOutput {
    func presentDetailRepo( _ response: DetailRepo.Response)
    func presentError(_ response: ErrorBoundaryModel.Response)
}

protocol DetailRepoDataStore {
    var data: SquareReposAPIModel? { get set }
}

// MARK: - Class
/**
    Class to <#business#>.
 */
class DetailRepoInteractor: DetailRepoDataStore {
    
    var data: SquareReposAPIModel?
    var output: DetailRepoInteractorOutput!
    
}

//MARK: - DetailRepoInteractorInput
extension DetailRepoInteractor: DetailRepoInteractorInput {
    
    // MARK: Business logic
    
    func loadData() {
        guard let data = data else {
            output.presentError(ErrorBoundaryModel.Response(errorMessage: "No data"))
            return
        }
        let iso8601DateFormatter = ISO8601DateFormatter()
        output.presentDetailRepo(DetailRepo.Response(id: data.id, fullName: data.fullName, description: data.description, starsCount: data.stargazersCount, lastUpdateDate: iso8601DateFormatter.date(from: data.updatedAt ?? "")))
    }
    
    
}

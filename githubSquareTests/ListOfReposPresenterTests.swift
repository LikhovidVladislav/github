//
//  ListOfReposPresenterTests.swift
//  githubSquare
//
//  Created by admin on 17.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import githubSquare
import Quick
import Nimble

class ListOfReposPresenterTests: QuickSpec {
    // MARK: Mock
    class OutputMock: ListOfReposPresenterOutput {
        func displayLoader(isDisplaying: Bool) {
            
        }
        
        func displayError(_ viewModel: ErrorBoundaryModel.Response.ViewModel) {
            
        }
        
        func displayData(_ viewModel: ListOfRepos.Response.ViewModel) {
            receivedViewModel = viewModel
        }
        
        var receivedViewModel: ListOfRepos.Response.ViewModel?
    }

    override func spec() {
        var presenter: ListOfReposPresenter!
        var output: OutputMock!
        
        beforeEach {
            presenter = ListOfReposPresenter()
            output = OutputMock()
            
            presenter.output = output
        }
        describe("Asked to present data") {
            var response: ListOfRepos.Response!
            
            beforeEach {
                response = ListOfRepos.Response(repos: [ListOfRepos.Response.Item(id: 1, name: "mock name", description: "mock description")])
                
                presenter.presentData(response)
            }
            it("makes view controller to display data.") {
                expect(output.receivedViewModel).to(equal(ListOfRepos.Response.ViewModel(repos: [ListOfRepos.Response.ViewModel.Item(id: 1, name: "mock name", description: "mock description")])))
            }
        }
    }
}

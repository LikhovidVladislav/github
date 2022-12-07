//
//  ListOfReposViewControllerTests.swift
//  githubSquare
//
//  Created by admin on 17.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import githubSquare
import Quick
import Nimble

class ListOfReposViewControllerTests: QuickSpec {
    // MARK: Mock
    class OutputMock: ListOfReposInteractorInput {
        
        func loadData() {
            
        }
    }
    
    // MARK: Cases
    override func spec() {
        let storyboard = UIStoryboard.storyboards.main.initiate()
        
        var viewController: ListOfReposViewController!
        var output: OutputMock!
        beforeEach {
            viewController = storyboard.initiateViewControllerFromType()
            output = OutputMock()
            
            viewController.output = output
        }
        describe("Asked to display data") {
            var viewModel: ListOfRepos.Response.ViewModel!
            
            beforeEach {
                viewController.viewDidLoad()
                viewModel = ListOfRepos.Response.ViewModel(repos: [ListOfRepos.Response.ViewModel.Item(id: 1, name: "name", description: "description")])
                
                viewController.displayData(viewModel)
            }
            it("makes view to display data.") {
                expect(viewModel.repos).to(equal(viewController.repos))
            }
        }
    }
}

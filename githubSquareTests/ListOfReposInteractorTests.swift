//
//  ListOfReposInteractorTests.swift
//  githubSquare
//
//  Created by admin on 17.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import githubSquare
import Quick
import Nimble
import Moya

class ListOfReposInteractorTests: QuickSpec {
    // MARK: Mock
    class OutputMock: ListOfReposInteractorOutput {
        func presentLoader(isPresenting: Bool) {
            
        }
        
        func presentData(_ response: ListOfRepos.Response) {
            print(response)
            receivedResponse = response
        }
        
        func presentError(_ response: ErrorBoundaryModel.Response) {
            receivedError = response
        }
        
        var receivedError: ErrorBoundaryModel.Response?
        var receivedResponse: ListOfRepos.Response?
    }
    
    class NetworkManagerMock: NetworkManager {
        
        func request<D: Decodable, T: TargetType>(service: T, completion: @escaping ((D?, MapError?) -> Void)) {
            let mockSquareReposApiModel = [SquareReposAPIModel(id: 1, name: "mock name", fullName: "mock full name", description: "mock description", stargazersCount: 1, updatedAt: "2020-01-16T17:11:17Z")]
            let data = try! JSONEncoder().encode(mockSquareReposApiModel)
            let convertedData = try! jsonDecoder.decode(D.self, from: data)
            completion(convertedData, nil)
            
        }
        
        var jsonDecoder = JSONDecoder()
        
    }

    override func spec() {
        var interactor: ListOfReposInteractor!
        var output: OutputMock!

        beforeEach {
            interactor = ListOfReposInteractor(networkManager: NetworkManagerMock())
            output = OutputMock()

            interactor.output = output
        }
        describe("Asked to load data") {
            
            beforeEach {
                interactor.loadData()
            }
            it("makes output to present data") {
                expect(output.receivedResponse).toEventually(equal(ListOfRepos.Response(repos: [ListOfRepos.Response.Item(id: 1, name: "mock name", description: "mock description")])))
            }
        }
    }
}

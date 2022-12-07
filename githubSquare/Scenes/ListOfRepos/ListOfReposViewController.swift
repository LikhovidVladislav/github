//
//  ListOfReposViewController.swift
//  githubSquare
//
//  Created by admin on 16.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Class
/**
    Class to control the view of the scene.
 */
class ListOfReposViewController: UIViewController {
    
    var output: ListOfReposInteractorInput!
    var router: ListOfReposRouter!
    
    var repos: [ListOfRepos.Response.ViewModel.Item] = [] {
        didSet {
            reposTableView.reloadData()
        }
    }
    
    //MARK: Outlets
    @IBOutlet weak var reposTableView: UITableView!
    
    private lazy var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.hidesWhenStopped = true
        return loader
    }()
    
    // MARK: Object lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
        ListOfReposConfigurator.inject(dependenciesFor: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        ListOfReposConfigurator.inject(dependenciesFor: self)
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: Event handling
    func setup() {
        //Loader
        self.view.addSubview(loader)
        loader.center = view.center
        reposTableView.register(ListOfReposTableViewCell.nib, forCellReuseIdentifier: ListOfReposTableViewCell.identifier)
        output.loadData()
    }
}

//MARK: - ListOfReposPresenterOutput
extension ListOfReposViewController: ListOfReposPresenterOutput{
    
    func displayLoader(isDisplaying: Bool) {
        isDisplaying ? loader.startAnimating() : loader.stopAnimating()
    }
    
    
    func displayError(_ viewModel: ErrorBoundaryModel.Response.ViewModel) {
        switch viewModel.errorType {
        case .alert:
            self.showAlert("Error", message: viewModel.errorMessage)
        case .someCustom:
            // Display some custom error
            break
        }
    }
    
    func displayData(_ viewModel: ListOfRepos.Response.ViewModel) {
        self.repos = viewModel.repos
    }
}

extension ListOfReposViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.goToDetailRepoScene(repoId: repos[indexPath.row].id)
    }
}

extension ListOfReposViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListOfReposTableViewCell.identifier, for: indexPath) as! ListOfReposTableViewCell
        cell.fill(name: repos[indexPath.row].name, description: repos[indexPath.row].description)
        return cell
    }
    
    
}

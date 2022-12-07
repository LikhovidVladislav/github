//
//  DetailRepoViewController.swift
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
class DetailRepoViewController: UIViewController {
    
    var output: DetailRepoInteractorInput!
    var router: DetailRepoRouter!
    
    var detailModel: [DetailRepo.Response.ViewModel.Item] = []
    
    // MARK: Outlets
    @IBOutlet weak var contentTableView: UITableView!
    
    // MARK: Object lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
        DetailRepoConfigurator.inject(dependenciesFor: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        DetailRepoConfigurator.inject(dependenciesFor: self)
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: Event handling
    func setup() {
        self.navigationItem.title = "Detail info"
        output.loadData()
        contentTableView.register(DetailRepoTableViewCell.nib, forCellReuseIdentifier: DetailRepoTableViewCell.identifier)
    }
}

//MARK: - DetailRepoPresenterOutput
extension DetailRepoViewController: DetailRepoPresenterOutput {
    
    // MARK: Display logic
    
    func dispalayDetalRepo(_ viewModel: DetailRepo.Response.ViewModel) {
        detailModel = viewModel.items
        contentTableView.reloadData()
    }
    
    func displayError(_ viewModel: ErrorBoundaryModel.Response.ViewModel) {
        switch viewModel.errorType {
        case .alert:
            self.showAlert("Error", message: viewModel.errorMessage)
        case .someCustom:
            break
        }
    }
}

extension DetailRepoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        detailModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailRepoTableViewCell.identifier, for: indexPath) as! DetailRepoTableViewCell
        cell.fill(title: detailModel[indexPath.row].title, description: detailModel[indexPath.row].description)
        return cell
    }
    
    
}

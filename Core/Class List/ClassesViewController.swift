//
//  ClassesViewController.swift
//  Core
//
//  Created by Pedro Contreras on 20/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import Foundation
import UIKit
import Combine

class ClassesViewController: UIViewController {
    
    var interactor: ClassesPresenter?
    
    private var subscription: AnyCancellable?
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ClassViewCell.self, forCellReuseIdentifier: ClassViewCell.reusableIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .background
        tableView.separatorStyle = .none
        return tableView
    }()

    lazy var dataSource: UITableViewDiffableDataSource<ClassesViewState.Section, Class> = {
        let dataSource = UITableViewDiffableDataSource<ClassesViewState.Section, Class>(tableView: tableView, cellProvider: cellProvider)
        dataSource.apply(.init(), animatingDifferences: false)
        return dataSource
    }()
    
    lazy var activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        title = "Classes"
        activityIndicatorView.backgroundColor = .background
        view.backgroundColor = .background
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        addSafelyConstrained(subview: tableView)
        addSafelyConstrained(subview: activityIndicatorView)
        subscription = interactor?.$viewState.receive(on: DispatchQueue.main).sink(receiveValue: updateViewState)
        interactor?.fetchAllClasses()
    }
    
    func cellProvider(tableView: UITableView, indexPath: IndexPath, class: Class) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCell(withIdentifier: ClassViewCell.reusableIdentifier, for: indexPath) as? ClassViewCell
        cell?.present(model: `class`)
        return cell
    }
    
    func updateViewState(state: ClassesViewState) {
        state.isLoading ? activityIndicatorView.startAnimating() : activityIndicatorView.stopAnimating()
        dataSource.apply(state.tableViewState)
    }    
}

extension ClassesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        interactor?.filterText.value = text
    }
}

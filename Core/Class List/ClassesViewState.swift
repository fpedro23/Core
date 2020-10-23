//
//  ClassesViewState.swift
//  Core
//
//  Created by Pedro Contreras on 20/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import Foundation
import UIKit

/// Struct containing the state of `ClassesViewController`.
struct ClassesViewState {
    
    /// Sections that should be displayed in `ClassesViewController.tableView`.
    enum Section {
        case main
    }
    
    /// Are the results currently being fetched?
    var isLoading: Bool = false
    
    /// A list of available classes.
    var classes: [Class] = []
    
    /// Diffable data source containing all the available classes.
    var tableViewState: NSDiffableDataSourceSnapshot<Section, Class> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Class>()
        snapshot.appendSections([.main])
        snapshot.appendItems(classes)
        return snapshot
    }    
}

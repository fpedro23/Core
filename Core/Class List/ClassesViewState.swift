//
//  ClassesViewState.swift
//  Core
//
//  Created by Pedro Contreras on 20/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import Foundation
import UIKit

struct ClassesViewState {
    
    enum Section {
        case main
    }
    
    
    var isLoading: Bool = false
    
    var classes: [Class] = []
    
    var tableViewState: NSDiffableDataSourceSnapshot<Section, Class> {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Class>()
        snapshot.appendSections([.main])
        snapshot.appendItems(classes)
        return snapshot
    }    
}

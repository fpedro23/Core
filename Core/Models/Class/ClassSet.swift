//
//  ClassSet.swift
//  Core
//
//  Created by Pedro Contreras on 22/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import Foundation

struct ClassSet: Codable {
    var classes: [Class]
    
    func filteringClassesWithTitle(_ string: String) -> ClassSet {
        var filtered = self
        filtered.classes = filtered.classes.filteringClassesWithTitle(string)
        return filtered
    }
}

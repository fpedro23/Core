//
//  ClassSet.swift
//  Core
//
//  Created by Pedro Contreras on 22/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import Foundation

/// Structure containing a list of classes.
struct ClassSet: Codable {
    
    /// The classes for this particular set.
    var classes: [Class]
    
    /// Will filter all the classes in the `classes` variable that contain the given title.
    /// - Parameter string: The string to match the title with.
    /// - Returns: A filtered `ClassSet`.
    func filteringClassesWithTitle(_ string: String) -> ClassSet {
        var filtered = self
        filtered.classes = filtered.classes.filteringClassesWithTitle(string)
        return filtered
    }
}

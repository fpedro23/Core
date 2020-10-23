//
//  API.swift
//  Core
//
//  Created by Pedro Contreras on 22/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import Foundation

/// Enumeration containing the endpoints for the application.
enum API {
        
    /// The base URL for the application.
    static var baseURL: URL {
        try! URL(string: "https://" + Configuration.value(for: "API_BASE_URL"))!
    }
    
    /// Path to fetch all the available classes.
    static var classesEndpoint: String {
        "classes"
    }
    
}

//
//  Services.swift
//  Core
//
//  Created by Pedro Contreras on 22/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import Foundation
import Combine

/// Class containing the publishers for the app's endpoints.
class Services {
    
    /// A pusblisher that will query a list of Classes
    static var classListService: AnyPublisher<ClassSet, Error> {
        URLSession.shared.dataTaskPublisher(for: API.baseURL.appendingPathComponent(API.classesEndpoint))
        .print("📶 Network 📶")
        .map { $0.data }
        .decode(type: ClassSet.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
}



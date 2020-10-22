//
//  Services.swift
//  Core
//
//  Created by Pedro Contreras on 22/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import Foundation
import Combine

class Services {
    static var classListService: AnyPublisher<ClassSet, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://core-class-search.herokuapp.com/classes")!)
        .print("📶 Network 📶")
        .map { $0.data }
        .decode(type: ClassSet.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
}

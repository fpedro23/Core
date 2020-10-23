//
//  MockServices.swift
//  CoreTests
//
//  Created by Pedro Contreras on 22/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import Foundation
import Combine
@testable import Core


class MockServices {
    static var mockClassService: AnyPublisher<ClassSet, Error> {
        Just(MockData.classList.data)
            .setFailureType(to: Error.self)
            .decode(type: ClassSet.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

enum MockData: String {
    case classList = "ClassList"
    
    var data: Data {
        guard
            let url = Bundle(for: MockServices.self).url(forResource: rawValue, withExtension: ".json"),
            let data = try? Data(contentsOf: url) else {
            fatalError("Couldn't find \(rawValue).json file.")
        }
        return data
    }
}

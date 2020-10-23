//
//  Class.swift
//  Core
//
//  Created by Pedro Contreras on 20/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import Foundation

typealias Instructor = String

/// A struct containing the information of a `Class`.
struct Class: Hashable {
    
    /// The class id.
    let id: Int
    
    /// The modality of the class.
    let modality: Modality
    
    /// The description for the class.
    let description: String
    
    /// The instructor of the class.
    let instructor: Instructor
    
    /// The title of the class.
    let title: String
        
    /// Duration of the class in minutes.
    let time: Int
}

extension Class: Codable {
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        modality = try values.decode(Modality.self, forKey: .modality)
        if let description = try? values.decode(String.self, forKey: .description) {
            self.description = description
        } else {
            description = ""
        }
        
        instructor = try values.decode(String.self, forKey: .instructor)
        title = try values.decode(String.self, forKey: .title)
        time = try values.decode(Int.self, forKey: .time)
    }
}

extension Array where Iterator.Element == Class {
    
    /// Will filter all the classes that contain the given string in the `title` property.
    /// - Parameter string: The string to match the title with.
    /// - Returns: A filtered array of classes.
    func filteringClassesWithTitle(_ string: String) -> [Class] {
        guard !string.isEmpty else { return self }
        return filter { $0.title.lowercased().contains(string.lowercased())}
    }
}

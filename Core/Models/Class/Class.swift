//
//  Class.swift
//  Core
//
//  Created by Pedro Contreras on 20/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import Foundation

struct Class: Hashable {
    
    let id: Int
    
    let modality: Modality
    
    let description: String
    
    let instructor: String
    
    let title: String
    
    // In minutes
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
    func filteringClassesWithTitle(_ string: String) -> [Class] {
        guard !string.isEmpty else { return self }
        return filter { $0.title.lowercased().contains(string.lowercased())}
    }
}

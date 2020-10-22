//
//  Modality.swift
//  Core
//
//  Created by Pedro Contreras on 22/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import Foundation

enum Modality: String, Codable {
    case weights = "Weights"
    case hiit = "HIIT"
    case dance = "Dance"
    case yoga = "Yoga"
    case unknown
    
    public init(from decoder: Decoder) throws {
        self = try Modality(rawValue: decoder.singleValueContainer().decode(String.self)) ?? .unknown
    }
}

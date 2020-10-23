//
//  Class+Fixtures.swift
//  CoreTests
//
//  Created by Pedro Contreras on 22/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import Foundation

@testable import Core

extension Class {
    static var yoga: Class {
        Class(id: -1,
              modality: .yoga,
              description: "Yoga description",
              instructor: "🐢",
              title: "⭐️",
              time: 50)
    }
}

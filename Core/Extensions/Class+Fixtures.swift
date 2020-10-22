//
//  Class+Fixtures.swift
//  Core
//
//  Created by Pedro Contreras on 21/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import Foundation

extension Class {
    static var error: Class {
        Class(id: -1,
              modality: .unknown,
              description: "Server Error",
              instructor: "",
              title: "Error",
              time: 0)
    }
}

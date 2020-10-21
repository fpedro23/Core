//
//  ClassViewCell.swift
//  Core
//
//  Created by Pedro Contreras on 20/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import Foundation
import UIKit

class ClassViewCell: UITableViewCell {
    
    static let reusableIdentifier = "ClassViewCell"
    
    let label: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addConstrained(subview: label)
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

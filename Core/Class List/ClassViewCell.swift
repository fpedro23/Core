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
    
    let classView = ClassView()
    
    lazy var separator: UIView = {
        let view: UIView = .separator(height: 1)
        view.backgroundColor = .systemGray5
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addConstrained(subview: separator, left: 16, bottom: nil)
        addConstrained(subview: classView, top:6.5, left: 24, bottom: -12, right: -24)
        backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func present(model: Class) {
        classView.present(model: model)
    }
}

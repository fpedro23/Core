//
//  UIView+Extensions.swift
//  Core
//
//  Created by Pedro Contreras on 20/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import UIKit

extension UIView {
    
    static func separator(height: CGFloat) -> UIView {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        return view
    }
    
    func addConstrained(subview: UIView,
                        top: CGFloat? = 0,
                        left: CGFloat? = 0,
                        bottom: CGFloat? = 0,
                        right: CGFloat? = 0) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)

        if let top = top {
            subview.topAnchor.constraint(equalTo: topAnchor, constant: top).isActive = true
        }
        if let left = left {
            subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: left).isActive = true
        }
        if let bottom = bottom {
            subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: bottom).isActive = true
        }
        if let right = right {
            subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: right).isActive = true
        }
    }
}

extension UIViewController {
    func addSafelyConstrained(subview: UIView,
                        top: CGFloat? = 0,
                        left: CGFloat? = 0,
                        bottom: CGFloat? = 0,
                        right: CGFloat? = 0) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subview)

        if let top = top {
            subview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: top).isActive = true
        }
        if let left = left {
            subview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: left).isActive = true
        }
        if let bottom = bottom {
            subview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: bottom).isActive = true
        }
        if let right = right {
            subview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: right).isActive = true
        }
    }
}

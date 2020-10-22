//
//  ClassView.swift
//  Core
//
//  Created by Pedro Contreras on 22/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import UIKit

class ClassView: UIView {
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleStackView, instructorLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.setCustomSpacing(5, after: instructorLabel)
        return stackView
    }()
    
    lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, modalityLabel, timeLabel])
        stackView.setCustomSpacing(4, after: titleLabel)
        stackView.setCustomSpacing(16, after: modalityLabel)
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Exciting"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    lazy var instructorLabel: UILabel = {
        let label = UILabel()
        label.text = "Instructor"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black.withAlphaComponent(0.4)
        label.text = "description"
        label.numberOfLines = 2
        let font = UIFont.systemFont(ofSize: 15)
        let fontMetrics = UIFontMetrics(forTextStyle: .body)
        label.font = fontMetrics.scaledFont(for: font)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    lazy var modalityLabel: UILabel = {
        let label = UILabel()
        label.text = "HIIT"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "50m"
        label.textColor = UIColor.black.withAlphaComponent(0.4)
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConstrained(subview: mainStackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func present(model: Class) {
        titleLabel.text = model.title
        modalityLabel.text = model.modality.rawValue
        modalityLabel.textColor = model.modality.textLabelColor
        instructorLabel.text = model.instructor
        descriptionLabel.text = model.description
    }
}


private extension Modality {
    var textLabelColor: UIColor {
        switch self {
        case .dance:
            return .dance
        case.hiit:
            return .hiit
        case .unknown:
            return .black
        case .weights:
            return .weights
        case .yoga:
            return .yoga
        }
    }
}

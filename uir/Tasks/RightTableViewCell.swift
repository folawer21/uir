//
//  RightTableViewCell.swift
//  uir
//
//  Created by Александр  Сухинин on 02.05.2024.
//

import UIKit

final class RightTableViewCell: UITableViewCell {
    private let answerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0  // Поддержка многолинейного текста
        label.font = .systemFont(ofSize: 16)
        label.layer.cornerRadius = 20
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textInput: UITextField = {
        let field = UITextField()
        field.layer.cornerRadius = 20
        field.keyboardType = .numberPad
        field.placeholder = "0"
        field.textColor = .black
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    func configCell(text: String) {
        answerLabel.text = text
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 20
        contentView.layer.backgroundColor = UIColor(named: "blueForViews")?.cgColor
        addSubviews()
        applyConstraints()
        
        // Обновляем высоту ячейки
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    private func addSubviews() {
        contentView.addSubview(textInput)
        contentView.addSubview(answerLabel)
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            textInput.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            textInput.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            textInput.widthAnchor.constraint(equalToConstant: 50),
            
            answerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            answerLabel.leadingAnchor.constraint(equalTo: textInput.trailingAnchor, constant: 8),
            answerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            answerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            textInput.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}

//
//  RightTableViewCell.swift
//  uir
//
//  Created by Александр  Сухинин on 02.05.2024.
//

import UIKit

final class RightTableViewCell: UITableViewCell{
    private let answerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.sizeToFit()
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    private let textInput: UITextField = {
        let field = UITextField()
        field.keyboardType = .numberPad
        field.placeholder = "0"
        field.textColor = .black
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    
    func configCell(text: String){
        answerLabel.text = text
        addSubviews()
        contentView.layer.backgroundColor = UIColor(named: "blueForViews")?.cgColor
        applyConstraints()
    }
    private func addSubviews(){
        contentView.addSubview(textInput)
        contentView.addSubview(answerLabel)
    }
    private func applyConstraints(){
        NSLayoutConstraint.activate([
            textInput.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            textInput.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 3),
            textInput.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5),
            textInput.trailingAnchor.constraint(equalTo: answerLabel.leadingAnchor, constant: -3),
            textInput.widthAnchor.constraint(equalToConstant: 20),
            
            answerLabel.leadingAnchor.constraint(equalTo: textInput.trailingAnchor, constant: 3),
            answerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            answerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5),
            answerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2)
   
        ])
    }
}

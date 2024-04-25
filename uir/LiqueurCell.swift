//
//  LiqueurCell.swift
//  uir
//
//  Created by Александр  Сухинин on 24.04.2024.
//

import UIKit

final class LiqueurCell: UITableViewCell{
    private var cellLabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
//        label.frame = CGRect(x: 0, y: 0, width: label.bounds.size.width, height: label.bounds.size.height)
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private var textField = {
//        let textField = UITextField()
//        textField.indent(size: 12)
//        textField.placeholder = "0"
//        textField.textColor = .black
//        textField.font = .boldSystemFont(ofSize: 16)
//        textField.backgroundColor = .white
//        textField.textAlignment = .center
//        textField.layer.cornerRadius = 10
//        textField.keyboardType = .numberPad
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//        
//    }()
    private func applyConstraints(){
        NSLayoutConstraint.activate([
            cellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            cellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            cellLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
//            cellLabel.trailingAnchor.constraint(equalTo: textField.leadingAnchor, constant: -5),
            cellLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6)
//            textField.leadingAnchor.constraint(equalTo: cellLabel.trailingAnchor, constant: 5),
//            textField.topAnchor.constraint(equalTo: cellLabel.topAnchor),
//            textField.bottomAnchor.constraint(equalTo: cellLabel.bottomAnchor),
//            textField.widthAnchor.constraint(equalToConstant: 45),
//            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6)
            
        ])
    }
    private func addSubViews(){
        contentView.addSubview(cellLabel)
//        contentView.addSubview(textField)
    }
    func configCell(text: String){
        cellLabel.text = text
        contentView.layer.borderWidth = 0.5
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = UIColor(named: "blueForViews")
        addSubViews()
        applyConstraints()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.cellLabel.text = ""
       }
}

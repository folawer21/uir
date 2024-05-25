//
//  LeftTableViewCell.swift
//  uir
//
//  Created by Александр  Сухинин on 01.05.2024.
//

import UIKit
//TODO: СДЕЛАТЬ TEXTVIEW а не UILABEL везде постараться где большие тексты
final class LeftTableViewCell: UITableViewCell{
    
    private var number: Int = 0
    private var numberLabel1: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
   
        return label
    }()
    private var taskLabel: UITextView = {
        let label = UITextView()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
//        label.numberOfLines = 0
        label.textAlignment = .left
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configCell(number:Int,cellText: String){
        numberLabel1.text = "\(number)"
        taskLabel.text = cellText
        contentView.layer.backgroundColor = UIColor(named: "blueForViews")?.cgColor
        addViews()
        applyConstraints()
    }
    private func addViews(){
        contentView.addSubview(numberLabel1)
        contentView.addSubview(taskLabel)
    }
    
    private func applyConstraints(){
        NSLayoutConstraint.activate([
            numberLabel1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            numberLabel1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 1),
            numberLabel1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5),
            numberLabel1.trailingAnchor.constraint(equalTo: taskLabel.leadingAnchor, constant: -3),
            numberLabel1.widthAnchor.constraint(equalToConstant: 20),
            
            taskLabel.leadingAnchor.constraint(equalTo: numberLabel1.trailingAnchor, constant: 3),
            taskLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            taskLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 5),
            taskLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2)
        ])
    }
}

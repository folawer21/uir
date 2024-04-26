//
//  ChooseRightAnswersCell.swift
//  uir
//
//  Created by Александр  Сухинин on 26.04.2024.
//

import UIKit

final class ChooseRightAnswersCell: UITableViewCell{
    private let taskLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.backgroundColor = .blueForViews
        return label
    }()
    
//    private let checkButton = {
//        let button = UIButton()
//        button.layer.cornerRadius = 10
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//        
//    }()
    //Поменять размер фотки 
    private let cellView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .uncheckedButton
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func configCell(text: String){
        taskLabel.text = text
        
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configContentView()
//        configButton()
        addSubViews()
        applyConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configContentView(){
        contentView.backgroundColor = .blueForViews
        contentView.layer.borderWidth = 0.5
        contentView.layer.cornerRadius = 10
    }
    
 
//    private func configButton(){
//        checkButton.setImage(UIImage(named: "uncheckedButton"), for: .normal)
//        checkButton.setImage(UIImage(named: "checkedButton"), for: .selected)
//        checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
//    }
    private func addSubViews(){
        contentView.addSubview(taskLabel)
        contentView.addSubview(cellView)
    }
    private func applyConstraints(){
        NSLayoutConstraint.activate([
            taskLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            taskLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            taskLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            taskLabel.trailingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: -5),
            cellView.leadingAnchor.constraint(equalTo: taskLabel.trailingAnchor, constant: 5),
            cellView.topAnchor.constraint(equalTo: taskLabel.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: taskLabel.bottomAnchor),
            cellView.widthAnchor.constraint(equalToConstant: 45),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6)
        ])
    }
    
    func checkButtonTapped() -> Bool{
        if cellView.image == UIImage(named: "uncheckedButton") {
            cellView.image = .checkedButton
            return true
        }else{
            cellView.image = .uncheckedButton
            return false 
        }
       
    }
}

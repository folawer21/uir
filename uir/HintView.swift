//
//  HintView.swift
//  uir
//
//  Created by Александр  Сухинин on 23.04.2024.
//

import UIKit

final class HintView: UIView{
    private let mistakes: Int
    private let hint: String
    private let mistakesLabel = UILabel()
    private let hintLabel = UILabel()
    private let hintWidth = UIScreen.main.bounds.width - 32
    private let hintHeight = UIScreen.main.bounds.height / 8
    
    init(frame: CGRect, mistakes: Int, hint: String) {
        self.mistakes = mistakes
        self.hint = hint
        self.mistakesLabel.text = "Количество ошибок: \(mistakes)"
        self.hintLabel.text = "Подсказка: \(hint)"
        super.init(frame: CGRect(origin: .zero, size: CGSize(width: hintWidth, height: hintHeight)))
        buildView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildView(){
        self.alpha = 0
        self.backgroundColor = UIColor(named: "blueForViews")
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        configMistakes()
        configHint()
        addSubViews()
        applyConstraints()
    }
    private func configHint(){
        hintLabel.sizeToFit()
        hintLabel.numberOfLines = 0
        hintLabel.font = .systemFont(ofSize: 16)
        hintLabel.textColor = .black
        hintLabel.translatesAutoresizingMaskIntoConstraints = false
        //        hintLabel.alpha = 0
    }
    private func configMistakes(){
        mistakesLabel.font = .systemFont(ofSize: 16)
        mistakesLabel.textColor = .black
        mistakesLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addSubViews(){
        self.addSubview(mistakesLabel)
        self.addSubview(hintLabel)
    }
    
    private func applyConstraints(){
        NSLayoutConstraint.activate([
            hintLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            hintLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            hintLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            mistakesLabel.topAnchor.constraint(equalTo: hintLabel.bottomAnchor, constant: 5),
            mistakesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mistakesLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            mistakesLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
    
    func show(){
        UIView.animate(withDuration: 0.2){
            self.alpha = 1
        }
    }
    func hide(){
        UIView.animate(withDuration: 0.2){
            self.alpha = 0
        }
    }
}

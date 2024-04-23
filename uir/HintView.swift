//
//  HintView.swift
//  uir
//
//  Created by Александр  Сухинин on 23.04.2024.
//

import UIKit

final class HintView: UIView{
    let mistakes: Int
    let hint: String
    let mistakesLabel = UILabel()
    let hintLabel = UILabel()
    init(frame: CGRect, mistakes: Int, hint: String) {
        self.mistakes = mistakes
        self.hint = hint
        self.mistakesLabel.text = "Количество ошибок: \(mistakes)"
        self.hintLabel.text = "Подсказка: \(hint)"
        super.init(frame: frame)
        buildView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildView(){
        self.alpha = 0
        
        configMistakes()
        configHint()
        addSubViews()
        applyConstraints()
    }
    private func configHint(){
        hintLabel.sizeToFit()
        hintLabel.numberOfLines = 0
        hintLabel.backgroundColor = .white
        hintLabel.font = .systemFont(ofSize: 16)
        hintLabel.textColor = .black
        hintLabel.translatesAutoresizingMaskIntoConstraints = false
        //        hintLabel.alpha = 0
    }
    private func configMistakes(){
        mistakesLabel.backgroundColor = .white
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
            mistakesLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            mistakesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mistakesLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            hintLabel.topAnchor.constraint(equalTo: mistakesLabel.bottomAnchor, constant: 5),
            hintLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            hintLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            hintLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
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

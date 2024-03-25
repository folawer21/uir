//
//  MarkOrCorrectTextViewController.swift
//  uir
//
//  Created by Александр  Сухинин on 25.03.2024.
//

import UIKit

final class MarkOrCorrectTextViewController: UIViewController{
    private let rightAnswer: String
    private var taskTextLabel:UILabel
    private let answerHereLabel: UILabel = {
        var textLabel = UILabel()
        textLabel.text = "Введите исправленный текст:"
        textLabel.font = .boldSystemFont(ofSize: 16)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    private var answerTextField: UITextField = {
        var textInput = UITextField()
        textInput.layer.cornerRadius = 10
        textInput.layer.borderWidth = 0.5
        textInput.translatesAutoresizingMaskIntoConstraints = false
        textInput.addTarget(self, action: #selector(textFieldDidBeginEditing), for: .editingDidBegin)
        textInput.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingDidEnd)
        textInput.translatesAutoresizingMaskIntoConstraints = false
        return textInput
    }()
    private let mistakesLabel: UILabel = {
        let mistakesLabel = UILabel()
        mistakesLabel.text = "Количество ошибок для исправления: "
        mistakesLabel.font = .boldSystemFont(ofSize: 16)
        mistakesLabel.translatesAutoresizingMaskIntoConstraints = false
        return mistakesLabel
    }()
    private var numberOfMistakesLabel: UILabel
    private let hintLabel: UILabel = {
        var hintLabel = UILabel()
        hintLabel.text = "Подсказка: "
        hintLabel.font = .boldSystemFont(ofSize: 16)
        hintLabel.translatesAutoresizingMaskIntoConstraints = false
        return hintLabel
    }()
    private var hint: UILabel
    private let sendButton: UIButton = {
        var button = UIButton()
        button.setTitle("Отправить", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        button.layer.borderWidth = 0.5
        button.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    //MARK: objc methods
    @objc
    private func sendButtonTapped(){
        let alert = UIAlertController()
        alert.message = (answerTextField.text == rightAnswer ? "Верно" : "Ошибка")
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    @objc
    private func textFieldDidBeginEditing(){
        answerTextField.layer.borderColor = UIColor.blue.cgColor
    }
    
    @objc
    private func textFieldDidEndEditing(){
        answerTextField.layer.borderColor = UIColor.black.cgColor
    }
    //MARK: Init
    init(taskTextLabel: String, answerTextField: UITextField, numberOfMistakesLabel: Int, answer: String,hint: String ) {
        self.taskTextLabel = UILabel()
        self.numberOfMistakesLabel = UILabel()
        self.hint = UILabel()
        self.taskTextLabel.text = taskTextLabel
        self.numberOfMistakesLabel.text = "\(numberOfMistakesLabel)"
        self.hint.text = hint
        self.rightAnswer = answer
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.taskTextLabel = UILabel()
        self.numberOfMistakesLabel = UILabel()
        self.hint = UILabel()
        self.taskTextLabel.text = ""
        self.numberOfMistakesLabel.text = ""
        self.hint.text = ""
        self.rightAnswer = ""
        super.init(coder: coder)
    }
    
}

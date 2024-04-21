//
//  MarkOrCorrectTextViewController.swift
//  uir
//
//  Created by Александр  Сухинин on 25.03.2024.
//

import UIKit

final class MarkOrCorrectTextViewController: UIViewController{
    //MARK: Блоки
    let taskBlock = UIView()
    let givenBlock = UIView()
    let answerBlock = UIView()
    //Mark: Заголовки блоков
    let headerTaskBlock = UIView()
    let headerGivenBlock = UIView()
    let headerAnswerBlock = UIView()
    
    //MARK: Тексты заголовков блоков
    private var headerTaskLabel:UILabel = {
        var textLabel = UILabel()
        textLabel.text = "Задание"
        textLabel.font = .boldSystemFont(ofSize: 16)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    private var headerGivenTextLabel:UILabel = {
        var textLabel = UILabel()
        textLabel.text = "Условие"
        textLabel.font = .boldSystemFont(ofSize: 16)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    private let headerAnswerLabel: UILabel = {
        var textLabel = UILabel()
        textLabel.text = "Ответ"
        textLabel.font = .boldSystemFont(ofSize: 16)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    //MARK: Тексты на блоках
    private var taskLabel:UILabel = {
        var textLabel = UILabel()
        textLabel.text = "Найдите ошибки и исправьте текст"
//        textLabel.textAlignment = .left
        textLabel.frame = CGRect(x: 0, y: 0, width: textLabel.bounds.size.width, height: textLabel.bounds.size.height)
        textLabel.font = .systemFont(ofSize: 16)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    private var givenTextLabel:UILabel = {
        var textLabel = UILabel()
        textLabel.textAlignment = .left
        textLabel.frame = CGRect(x: 0, y: 0, width: textLabel.bounds.size.width, height: textLabel.bounds.size.height)
        textLabel.font = .systemFont(ofSize: 16)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
  
    
    
    private var answerTextField: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.backgroundColor = UIColor(named: "blueForViews")
        textView.textColor = .black
        textView.layer.cornerRadius = 5.0
        textView.text = "Введите ответ здесь..."
        return textView

    }()
//    private let mistakesLabel: UILabel = {
//        let mistakesLabel = UILabel()
//        mistakesLabel.text = "Количество ошибок: "
//        mistakesLabel.font = .boldSystemFont(ofSize: 16)
//        mistakesLabel.translatesAutoresizingMaskIntoConstraints = false
//        return mistakesLabel
//    }()
    private var numberOfMistakes: Int
    private var hint: String
//    private let hintLabel: UILabel = {
//        var hintLabel = UILabel()
//        hintLabel.text = "Подсказка: "
//        hintLabel.font = .boldSystemFont(ofSize: 16)
//        hintLabel.translatesAutoresizingMaskIntoConstraints = false
//        return hintLabel
//    }()
   
    private let sendButton: UIButton = {
        var button = UIButton()
        button.setTitle("Отправить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "blueForHeaders")
        return button
    }()
    private let hintButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "infoButton"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    //MARK: objc methods
    
    @objc
    private func infoButtonTapped(){
        //TODO: UIVIew на котором будет hint, mistakes label => отдельный класс с инитом
        let alert = UIAlertController()
        alert.message = "ПОДСКАЗКА"
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
        present(alert, animated: true)
    }
    @objc
    private func sendButtonTapped(){
        let alert = UIAlertController()
        alert.message = (answerTextField.text == "True" ? "Верно" : "Ошибка")
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
    init(taskText: String, mistakes: Int,hint: String ) {
        self.givenTextLabel.text = "Условие задачи "
        self.numberOfMistakes = mistakes
        self.hint = hint
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.givenTextLabel.text = ""
        self.numberOfMistakes = 0
        self.hint = ""
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        addActions()
        addViews()
        addViewToBlocks()
        applyConstraints()
        
    }
    func setupViews(){
        answerTextField.delegate = self
        taskBlock.blockView(radious: 20)
        givenBlock.blockView(radious: 20)
        answerBlock.blockView(radious: 20)
        headerTaskBlock.headerView(radious: 20)
        headerGivenBlock.headerView(radious: 20)
        headerAnswerBlock.headerView(radious: 20)
    }
    func addActions(){
        hintButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }
    
    func addViews(){
        view.addSubview(headerTaskBlock)
        view.addSubview(headerGivenBlock)
        view.addSubview(headerAnswerBlock)
        
        view.addSubview(taskBlock)
        view.addSubview(givenBlock)
        view.addSubview(answerBlock)
        
        view.addSubview(sendButton)
        view.addSubview(hintButton)
    }
    func addViewToBlocks(){
        headerTaskBlock.addSubview(headerTaskLabel)
        headerGivenBlock.addSubview(headerGivenTextLabel)
        headerAnswerBlock.addSubview(headerAnswerLabel)
        
        
        taskBlock.addSubview(taskLabel)
        givenBlock.addSubview(givenTextLabel)
        answerBlock.addSubview(answerTextField)
    }
    
    func applyConstraints(){
        //TODO: Раскидать по Большим вьюшкам теоретически можно
        let blockWidth = UIScreen.main.bounds.width - 32
        let smallBlockHeight = UIScreen.main.bounds.height / 8.7
        let bigBlockHeight = UIScreen.main.bounds.height / 4.18
        
        
        let headerWidth = blockWidth / 2.5
        let headerHeight = CGFloat(36)
        let smallBlockIndent = CGFloat(30)
        let bigBlockIndent = CGFloat(35)
        let buttonIndent = bigBlockIndent - 5
        
        let buttonWidth = UIScreen.main.bounds.width/2.45
        let sendButtonHeight = CGFloat(54)
        let hintButtonSize = CGFloat(54)
        NSLayoutConstraint.activate([
            headerTaskBlock.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerTaskBlock.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            headerTaskBlock.widthAnchor.constraint(equalToConstant: headerWidth),
            headerTaskBlock.heightAnchor.constraint(equalToConstant: headerHeight),
            
            taskBlock.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            taskBlock.widthAnchor.constraint(equalToConstant: blockWidth),
            taskBlock.topAnchor.constraint(equalTo: headerTaskBlock.topAnchor, constant: 25),
            taskBlock.heightAnchor.constraint(equalToConstant: smallBlockHeight),
            
            headerGivenBlock.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerGivenBlock.topAnchor.constraint(equalTo: taskBlock.bottomAnchor, constant: smallBlockIndent),
            headerGivenBlock.widthAnchor.constraint(equalToConstant: headerWidth),
            headerGivenBlock.heightAnchor.constraint(equalToConstant: headerHeight),
            
            givenBlock.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            givenBlock.widthAnchor.constraint(equalToConstant: blockWidth),
            givenBlock.topAnchor.constraint(equalTo: headerGivenBlock.topAnchor, constant: 25),
            givenBlock.heightAnchor.constraint(equalToConstant: bigBlockHeight),
            
            headerAnswerBlock.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerAnswerBlock.topAnchor.constraint(equalTo: givenBlock.bottomAnchor, constant: bigBlockIndent),
            headerAnswerBlock.widthAnchor.constraint(equalToConstant: headerWidth),
            headerAnswerBlock.heightAnchor.constraint(equalToConstant: headerHeight),
            
            answerBlock.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            answerBlock.widthAnchor.constraint(equalToConstant: blockWidth),
            answerBlock.topAnchor.constraint(equalTo: headerAnswerBlock.topAnchor, constant: 25),
            answerBlock.heightAnchor.constraint(equalToConstant: bigBlockHeight),
            
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.topAnchor.constraint(equalTo: answerBlock.bottomAnchor, constant: buttonIndent),
            sendButton.heightAnchor.constraint(equalToConstant: sendButtonHeight),
            sendButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            
            hintButton.leadingAnchor.constraint(equalTo: sendButton.trailingAnchor,constant: headerHeight),
            hintButton.widthAnchor.constraint(equalToConstant: hintButtonSize),
            hintButton.heightAnchor.constraint(equalToConstant: hintButtonSize),
            hintButton.topAnchor.constraint(equalTo: sendButton.topAnchor, constant: (sendButtonHeight - hintButtonSize) / 2),
            
            
            headerTaskLabel.topAnchor.constraint(equalTo: headerTaskBlock.topAnchor, constant: 10),
            headerTaskLabel.leadingAnchor.constraint(equalTo: headerTaskBlock.leadingAnchor,constant: 20),
            headerTaskLabel.trailingAnchor.constraint(equalTo: headerTaskBlock.trailingAnchor),
            headerTaskLabel.bottomAnchor.constraint(equalTo: headerTaskBlock.bottomAnchor,constant: -14),
            
            headerGivenTextLabel.topAnchor.constraint(equalTo: headerGivenBlock.topAnchor, constant: 10),
            headerGivenTextLabel.leadingAnchor.constraint(equalTo: headerGivenBlock.leadingAnchor,constant: 20),
            headerGivenTextLabel.trailingAnchor.constraint(equalTo: headerGivenBlock.trailingAnchor),
            headerGivenTextLabel.bottomAnchor.constraint(equalTo: headerGivenBlock.bottomAnchor,constant: -14),
            
            headerAnswerLabel.topAnchor.constraint(equalTo: headerAnswerBlock.topAnchor, constant: 10),
            headerAnswerLabel.leadingAnchor.constraint(equalTo: headerAnswerBlock.leadingAnchor,constant: 20),
            headerAnswerLabel.trailingAnchor.constraint(equalTo: headerAnswerBlock.trailingAnchor),
            headerAnswerLabel.bottomAnchor.constraint(equalTo: headerAnswerBlock.bottomAnchor,constant: -14),
            
            taskLabel.topAnchor.constraint(equalTo: taskBlock.topAnchor, constant: 15),
            taskLabel.leadingAnchor.constraint(equalTo: taskBlock.leadingAnchor, constant: 20),
            taskLabel.trailingAnchor.constraint(equalTo: taskBlock.trailingAnchor, constant: -15),
            
            givenTextLabel.topAnchor.constraint(equalTo: givenBlock.topAnchor, constant: 15),
            givenTextLabel.leadingAnchor.constraint(equalTo: givenBlock.leadingAnchor, constant: 20),
            givenTextLabel.trailingAnchor.constraint(equalTo: givenBlock.trailingAnchor, constant: -15),
            
            answerTextField.topAnchor.constraint(equalTo: answerBlock.topAnchor, constant: 15),
            answerTextField.leadingAnchor.constraint(equalTo: answerBlock.leadingAnchor, constant: 20),
            answerTextField.trailingAnchor.constraint(equalTo: answerBlock.trailingAnchor, constant: -15),
            answerTextField.bottomAnchor.constraint(equalTo: answerBlock.bottomAnchor, constant: -20)
        ])
        
    }
    

}

extension MarkOrCorrectTextViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Введите ответ здесь..."
        {
            textView.text = ""
        }
    }
}

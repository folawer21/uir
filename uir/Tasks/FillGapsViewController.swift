//
//  FillGapsViewController.swift
//  uir
//
//  Created by Александр  Сухинин on 23.04.2024.
//

//TODO: ScrollView воткнуть мб?????? или все поднять
import UIKit

final class FillGapsViewController: UIViewController{
    weak var delegate: TaskViewController?
    // MARK: Подсказка
    let hintView: HintView
    //MARK: Блоки
    private let taskBlock = UIView()
    private let givenBlock = UIView()
    private let answerBlock = UIView()
    //MARK: Заголовки блоков
    private let headerTaskBlock = UIView()
    private let headerGivenBlock = UIView()
    private let headerAnswerBlock = UIView()
   
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
        textLabel.text = "Заполните пропуск в тексте"
        textLabel.frame = CGRect(x: 0, y: 0, width: textLabel.bounds.size.width, height: textLabel.bounds.size.height)
        textLabel.font = .systemFont(ofSize: 16)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    private var givenTextLabel:UILabel = {
        var textLabel = UILabel()
        textLabel.textAlignment = .left
        textLabel.numberOfLines = 0
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
        textView.text = "Введите пропущенное значение здесь..."
        return textView

    }()

    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("", for: .normal)
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let sendButton: UIButton = {
        var button = UIButton()
        button.setTitle("Отправить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
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
    private func infoButtonTappedUp(){
        hintView.hide()
    }
    @objc
    private func infoButtonDown(){
        configHintView()
        hintView.show()
    }
    @objc private func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc
    private func sendButtonTapped(){
        //TODO: проверка через сервер
        if 1 == 1{
            let alert = UIAlertController(title: "Пройдено!", message: "Вы успешно выполнили задание. \n Ваша оценка 100 баллов.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Закрыть", style: .default){ [weak self] result in
                self?.dismiss(animated: true)
                self?.delegate?.fetchNextTask()
            })
            present(alert, animated: true)
        }else{
            let alert = UIAlertController(title: "Неверно", message: "Вы допустили ошибку. \n Ваша оценка 0 баллов.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
            present(alert, animated: true)
        }
    }
    //MARK: Init
    init(taskText: String, mistakes: Int,hint: String ) {
        self.givenTextLabel.text = "Условие задачи "
        self.hintView = HintView(frame: .zero, mistakes: mistakes, hint: hint)
        super.init(nibName: nil, bundle: nil)
    }
    init(data: FillGapsTask){
        self.givenTextLabel.text = data.text
        self.hintView = HintView(frame: .zero, mistakes: 0, hint: data.hint)
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        self.givenTextLabel.text = ""
        self.hintView = HintView(frame: .zero, mistakes: 0, hint: "")
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let backButton = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(backButtonTapped))
        self.navigationItem.leftBarButtonItem = backButton
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
        hintButton.addTarget(self, action: #selector(infoButtonTappedUp), for: .touchUpInside)
        hintButton.addTarget(self, action: #selector(infoButtonDown), for: .touchDown)
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

    }
    func addViews(){
        
        view.addSubview(headerTaskBlock)
        view.addSubview(headerGivenBlock)
        view.addSubview(headerAnswerBlock)
       
        
        view.addSubview(taskBlock)
        view.addSubview(givenBlock)
        view.addSubview(answerBlock)
        
        view.addSubview(backButton)
        view.addSubview(sendButton)
        view.addSubview(hintButton)
        view.addSubview(hintView)
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
        let smallBlockHeight = UIScreen.main.bounds.height / 10
        let bigBlockHeight = UIScreen.main.bounds.height / 3
        
        
        let headerWidth = blockWidth / 2.5
        let headerHeight = CGFloat(36)
        let smallBlockIndent = CGFloat(30)
        let bigBlockIndent = CGFloat(35)
        let buttonIndent = bigBlockIndent - 5
        
        let buttonWidth = UIScreen.main.bounds.width/2.45
        let sendButtonHeight = CGFloat(54)
        let hintButtonSize = CGFloat(54)
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 3),
            
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
            answerBlock.heightAnchor.constraint(equalToConstant: smallBlockHeight),
            
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

    func configHintView(){
        let buttonFrame = hintButton.frame
        hintView.frame.origin = CGPoint(x: self.view.frame.minX + 10 , y: buttonFrame.maxY - 5 - hintView.frame.height)
    }

}

extension FillGapsViewController: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Введите пропущенное значение здесь..."
        {
            textView.text = ""
        }
    }
    
}

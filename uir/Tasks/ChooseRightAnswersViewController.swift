//
//  ChoseRightAnswersViewController.swift
//  uir
//
//  Created by Александр  Сухинин on 26.04.2024.
//

//TODO: ПЕРЕДЕЛАТЬ НАХУЙ ЧТОБЫ НЕ У ЯЧЕЙКИ БЫЛА КНОПКА А ПРОСТО ПРИ НАЖАТИИ НА ЯЧЕЙКУ стиль ячейки менялся и соотвественно инфа на бэк уходила( добавлялась в массив строчка которая выбрана)
import UIKit

final class ChooseRightAnswersViewController: UIViewController{
    weak var delegate: TaskViewController?
    private let inputArr: [String]
    private var outputArr: [String]  = []
    private let tableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 10
        return tableView
    }()
    private let headerView = UIView()
    private let blockView = UIView()
    private let givenLabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.frame = CGRect(x: 0, y: 0, width: label.bounds.size.width, height: label.bounds.size.height)
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let headerLabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.text = "Задание"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    private let sendButton = {
        let button = UIButton()
        button.setTitle("Отправить", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font =  .boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "blueForHeaders")
        return button
    }()
    @objc func backButtonTapped(){
        self.dismiss(animated: true,completion: nil)
    }
    @objc private func sendButtonTapped(){
        //TODO: проверка через сервер
        if 1==1{
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
    private func configViews(){
        blockView.blockView(radious: 20)
        headerView.headerView(radious: 20)
    }
    private func addTargets(){
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)

    }
    private func addViewsToMain(){
        view.addSubview(tableView)
        view.addSubview(headerView)
        view.addSubview(blockView)
        view.addSubview(backButton)
        view.addSubview(sendButton)
    }
    private func addViewsToSubViews(){
        headerView.addSubview(headerLabel)
        blockView.addSubview(givenLabel)
    }
    private func addSubViews(){
        addViewsToMain()
        addViewsToSubViews()
    }
    
    private func applyConstraints(){
        let blockWidth = UIScreen.main.bounds.width - 32
        let smallBlockHeight = UIScreen.main.bounds.height / 8

        let headerWidth = blockWidth / 2.5
        let headerHeight = CGFloat(36)
        let smallBlockIndent = CGFloat(30)
        let bigBlockIndent = CGFloat(35)
        let buttonIndent = bigBlockIndent - 5
        
        let buttonWidth = UIScreen.main.bounds.width/2.45
        let sendButtonHeight = CGFloat(54)
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 3),
            
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            headerView.widthAnchor.constraint(equalToConstant: headerWidth),
            headerView.heightAnchor.constraint(equalToConstant: headerHeight),
            
            blockView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            blockView.widthAnchor.constraint(equalToConstant: blockWidth),
            blockView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 25),
            blockView.heightAnchor.constraint(equalToConstant: smallBlockHeight),
            
            tableView.topAnchor.constraint(equalTo: blockView.bottomAnchor,constant: smallBlockIndent),
            tableView.leadingAnchor.constraint(equalTo: blockView.leadingAnchor),
            tableView.widthAnchor.constraint(equalToConstant: blockWidth),
            tableView.bottomAnchor.constraint(equalTo: sendButton.topAnchor, constant: -15),
            
            sendButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            sendButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            sendButton.heightAnchor.constraint(equalToConstant: sendButtonHeight),
            sendButton.widthAnchor.constraint(equalToConstant: buttonWidth),
                
            
            headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor,constant: -14),
        
            
            givenLabel.topAnchor.constraint(equalTo: blockView.topAnchor, constant: 15),
            givenLabel.leadingAnchor.constraint(equalTo: blockView.leadingAnchor, constant: 20),
            givenLabel.trailingAnchor.constraint(equalTo: blockView.trailingAnchor, constant: -15)

        
        
        ])
    }
    
    init(task:String) {
        givenLabel.text = task
        inputArr = []
        super.init(nibName: nil, bundle: nil)
    }
    
    init(data: ChooseRightTask){
        givenLabel.text = data.task
        inputArr = data.answers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        givenLabel.text = ""
        inputArr = []
        super.init(coder: coder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        let backButton = UIBarButtonItem(title: "Назад", style: .plain, target: self, action: #selector(backButtonTapped))
//        tableView.register(ChooseRightAnswersCell.self, forHeaderFooterViewReuseIdentifier: "rightAnswerCell")
        tableView.register(ChooseRightAnswersCell.self, forCellReuseIdentifier: "rightAnswerCell")
        
        configViews()
        addTargets()
        addSubViews()
        applyConstraints()
//        self.updateLayout(with: self.view.frame.size)
        
    }
    
}


extension ChooseRightAnswersViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "rightAnswerCell", for: indexPath) as? ChooseRightAnswersCell else {
            return UITableViewCell()
        }
        let text = inputArr[indexPath.row]
        cell.selectionStyle = .none
        cell.configCell(text: text)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputArr.count
    }
    
}

extension ChooseRightAnswersViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ChooseRightAnswersCell else {
            return
        }
        let flag = cell.checkButtonTapped()
        
        if flag == true{
            outputArr.append(inputArr[indexPath.row])
        }
        else{
            outputArr.removeAll(where: {$0 == inputArr[indexPath.row]})
        }
    }
}


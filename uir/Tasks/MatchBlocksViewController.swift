//
//  MatchBlocksViewController.swift
//  uir
//
//  Created by Александр  Сухинин on 01.05.2024.
//

import UIKit


final class MatchBlocksViewController: UIViewController{
    weak var delegate: TaskViewController?
    private let leftTable: [String]
    private var rightTable: [String]
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
        button.tintColor = .black
        button.setImage(UIImage(named: "backButton"), for: .normal)
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
    
    private let leftTableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 10
        tableView.backgroundColor = .white
//        tableView.layer.borderWidth = 1
//        tableView.isScrollEnabled = true
        return tableView
    }()
    private let rightTableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 10
        tableView.backgroundColor = .white
//        tableView.layer.borderWidth = 1
//        tableView.isScrollEnabled = true
        return tableView
    }()
    private let headerView = UIView()
    private let blockView = UIView()
    private let givenLabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Установите соответствие"
        label.frame = CGRect(x: 0, y: 0, width: label.bounds.size.width, height: label.bounds.size.height)
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
    @objc private func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
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
        view.addSubview(leftTableView)
        view.addSubview(rightTableView)
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
        let smallBlockIndent = CGFloat(20)
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
            
            leftTableView.topAnchor.constraint(equalTo: blockView.bottomAnchor,constant: smallBlockIndent),
            leftTableView.leadingAnchor.constraint(equalTo: blockView.leadingAnchor),
            leftTableView.widthAnchor.constraint(equalToConstant: blockWidth/2 - 2.5),
            leftTableView.bottomAnchor.constraint(equalTo: sendButton.topAnchor, constant: -15),
            leftTableView.trailingAnchor.constraint(equalTo: rightTableView.leadingAnchor, constant: -5),
            
            rightTableView.topAnchor.constraint(equalTo: blockView.bottomAnchor,constant: smallBlockIndent),
            rightTableView.leadingAnchor.constraint(equalTo: leftTableView.trailingAnchor,constant: 5),
            rightTableView.widthAnchor.constraint(equalToConstant: blockWidth/2 - 2.5),
            rightTableView.bottomAnchor.constraint(equalTo: sendButton.topAnchor, constant: -15),
            
            
            
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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        leftTableView.rowHeight = UITableView.automaticDimension
        leftTableView.estimatedRowHeight = 30
        leftTableView.dataSource = self
        leftTableView.delegate = self
        leftTableView.register(LeftTableViewCell.self, forCellReuseIdentifier: "LeftTableViewCell")
        
        rightTableView.rowHeight = UITableView.automaticDimension
        rightTableView.estimatedRowHeight = 30
        rightTableView.dataSource = self
        rightTableView.delegate = self
        rightTableView.register(RightTableViewCell.self, forCellReuseIdentifier: "RightTableViewCell")
//        rightTableView.isEditing = true
        
        leftTableView.layer.cornerRadius = 10
        rightTableView.layer.cornerRadius = 10
        configViews()
        addTargets()
        addSubViews()
        applyConstraints()
        self.updateLayout(with: self.view.frame.size)
    }
    private func updateLayout(with size: CGSize) {
       self.leftTableView.frame = CGRect.init(origin: .zero, size: size)
    }
    
    init(task: String, left: [String], right: [String]){
        leftTable = left
        rightTable = right
        super.init(nibName: nil, bundle: nil)
    }
    
    init(data:MatchBlocksTask ){
        leftTable = data.leftTable
        rightTable = data.rightTable
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        leftTable = []
        rightTable = []
        super.init(coder: coder)
    }
}

extension MatchBlocksViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if tableView == leftTableView{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LeftTableViewCell", for: indexPath) as? LeftTableViewCell else {
                return UITableViewCell()}
            cell.configCell(number: indexPath.row, cellText: leftTable[indexPath.row])
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RightTableViewCell", for: indexPath) as? RightTableViewCell else {
                return UITableViewCell()}
            cell.configCell(text: rightTable[indexPath.row])
            return cell
        }
       
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == leftTableView {
            return leftTable.count
        } else {
            return rightTable.count
        }
    }
    
    
}



extension MatchBlocksViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//    
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        if tableView == rightTableView {
//            let removedElement = englishWords.remove(at: sourceIndexPath.row)
//            englishWords.insert(removedElement, at: destinationIndexPath.row)
//        }
//
//    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .none
//    }
    
//    func tableView(_ tableView: UITableView, editingActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        if tableView == rightTableView {
//            let moveAction = UITableViewRowAction(style: .normal, title: "Переместить") { (action, indexPath) in
//                // Выполнить действие перемещения
//                
//            }
//            
//            return [moveAction]
//        }else{
//            return nil
//        }
//    }
    



    
}

//
//  LiqueurScaleViewController.swift
//  uir
//
//  Created by Александр  Сухинин on 24.04.2024.
//

import UIKit
//TODO: Сделать перетягивание ячеек вместо цифр, чтобы потом валидацию не делать так удобнее будет
final class LiqueurScaleViewController: UIViewController{
    private let arr = ["Отображение задачи в математическую модель","Постановка задачи","Автоматическая трансляция во внутренний язык ЭВМ","Трансляция модели в программу на языке высокого уровня","AFs afds DSFSFD"]
    private let headerLabel = {
        //Проверить нужен ли sizeToFit()
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.text = "Задание"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    private let tableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 10
        tableView.backgroundColor = .white
        tableView.layer.borderWidth = 1
//        tableView.isScrollEnabled = true
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
    
    
   
    @objc private func sendButtonTapped(){
        let alert = UIAlertController()
        alert.message = "True" == "False" ? "Верно" : "Ошибка"
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
        present(alert, animated: true)
    }
    private func configViews(){
        blockView.blockView(radious: 20)
        headerView.headerView(radious: 20)
    }
    private func addTargets(){
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }
    private func addViewsToMain(){
        view.addSubview(tableView)
        view.addSubview(headerView)
        view.addSubview(blockView)
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
            
            sendButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -18),
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
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(LiqueurCell.self, forCellReuseIdentifier: "liqueurCell")


//        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 10)
//        tableView.scrollIndicatorInsets = tableView.contentInset
        
        configViews()
        addTargets()
        addSubViews()
        applyConstraints()
        self.updateLayout(with: self.view.frame.size)
    }
    private func updateLayout(with size: CGSize) {
       self.tableView.frame = CGRect.init(origin: .zero, size: size)
    }
    
    init(task: String){
        givenLabel.text = task
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        givenLabel.text = ""
        super.init(coder: coder)
    }
}

extension LiqueurScaleViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "liqueurCell", for: indexPath) as? LiqueurCell else{
            return UITableViewCell()
        }
        

//        let text = arr[indexPath.row]

      
        if indexPath.row % 2 == 0{
            cell.configCell(text: arr[indexPath.row / 2])
        }else{
            cell.isHidden = true

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 1{
            return 3
        }else{
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arr.count
        return arr.count * 2 - 1
    }
    
    
}

extension LiqueurScaleViewController: UITableViewDelegate{
    
  
}

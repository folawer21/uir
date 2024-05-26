//
//  TaskViewController.swift
//  uir
//
//  Created by Александр  Сухинин on 19.03.2024.
//

import UIKit

final class TaskViewController: UIViewController{
    let helper = TaskViewControllerHelper()
    let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Начать решение", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font =  .boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "blueForHeaders")
        return button
    }()
    private func buildScreen(){
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 100),
        ])
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    @objc private func startButtonTapped(){
        UIBlockingProgressHUD.show()
        helper.fetchNext()
    }
    func fetchNextTask(){
        helper.removeTask()
        helper.fetchNext()
    }
    
    func showWellDoneAlert(){
        UIBlockingProgressHUD.dissmiss()
        let alert = UIAlertController(title: "Поздравляем!", message: "Вы успешно завершили все УТЗ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
        present(alert,animated: true)
    }
    
    func showMarkOrCorrectVC(data: MarkOrCorrectTask){
        let vc = MarkOrCorrectTextViewController(data: data)
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        UIBlockingProgressHUD.dissmiss()
        navigationController?.present(vc, animated: true)
    }
    func showFillGapsVC(data: FillGapsTask){
        let vc = FillGapsViewController(data: data)
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        UIBlockingProgressHUD.dissmiss()
        navigationController?.present(vc, animated: true)
    }
    func showChooseRightVC(data: ChooseRightTask){
        let vc = ChooseRightAnswersViewController(data: data)
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        UIBlockingProgressHUD.dissmiss()
        navigationController?.present(vc, animated: true)
    }
    func showMatchBlocksVC(data: MatchBlocksTask){
        let vc = MatchBlocksViewController(data: data)
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        UIBlockingProgressHUD.dissmiss()
        navigationController?.present(vc, animated: true)
    }
    func showPhotoOrderVC(data: PhotoOrderTask){
        //TODO: Конструкток из структуры
        let vc = CorrectPhotosOrderViewController(task: "safafs sfaf")
        UIBlockingProgressHUD.dissmiss()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    private func configureBackButton(){
        navigationController?.navigationBar.backgroundColor = UIColor.white
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backButton")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backButton")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.black
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackButton()
        helper.viewController = self
        buildScreen()
        view.backgroundColor = .white
    }
    
}


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
            startButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    @objc private func startButtonTapped(){
        UIBlockingProgressHUD.show()
        helper.buttonTapped()
    }
//    func enableButton(){
//        startButton.isEnabled = true
//    }
//    func disableButton(){
//        startButton.isEnabled = false
//    }
    func showMarkOrCorrectVC(data: MarkOrCorrectTask){
        //TODO: Конструкток из структуры
        let vc = MarkOrCorrectTextViewController(taskText: "test", mistakes: 1, hint: "bebebe")
        UIBlockingProgressHUD.dissmiss()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func showFillGapsVC(data: FillGapsTask){
        //TODO: Конструкток из структуры
        let vc = FillGapsViewController(taskText: "test", mistakes: 1, hint: "bebebe")
        UIBlockingProgressHUD.dissmiss()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func showChooseRightVC(data: ChooseRightTask){
        //TODO: Конструкток из структуры
        let vc = ChooseRightAnswersViewController(task: "bebebebbe")
        UIBlockingProgressHUD.dissmiss()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func showMatchBlocksVC(data: MatchBlocksTask){
        //TODO: Конструкток из структуры
        let vc = MatchBlocksViewController(task: "Besafsa")
        UIBlockingProgressHUD.dissmiss()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func showPhotoOrderVC(data: PhotoOrderTask){
        //TODO: Конструкток из структуры
        let vc = CorrectPhotosOrderViewController(task: "safafs sfaf")
        UIBlockingProgressHUD.dissmiss()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helper.viewController = self
        buildScreen()
        view.backgroundColor = .white
    }
    
}


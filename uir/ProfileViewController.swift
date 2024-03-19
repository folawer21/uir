//
//  ProfileViewController.swift
//  uir
//
//  Created by Александр  Сухинин on 19.03.2024.
//

import UIKit

final class ProfileViewController: UIViewController{
    let profileImageView = UIImageView()
    let fioLabel = UILabel()
    let groupLabel = UILabel()
    let resultsLabel = UILabel()
    let nameTestLabel = UILabel()
    let variantTestLabel = UILabel()
    let dateTestLabel = UILabel()
    let markTestLabel = UILabel()
    
    let prevTestsButton = UIButton()
    
  
    private func setProfileImage(mark: Int){
        if mark > 90{
            print("the best")
        } else if mark > 60 && mark <= 90 {
            print("NT Bro")
        } else {
            print("Bad mark")
        }
    }
    
    func setLabels(fio: String, group: String,testName: String,testVariant: String, testDate: String, testMark: String){
        setFio(fio: fio)
        setGroup(group: group)
        setTestName(testName: testName)
        setTestDate(testDate: testDate)
        setTestMark(testMark: testMark)
    }
    
    func confingScreen(){
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        fioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        groupLabel.translatesAutoresizingMaskIntoConstraints = false
        
        resultsLabel.textAlignment = .center
        resultsLabel.text = "Результаты последнего тестирования"
        resultsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameTestLabel.translatesAutoresizingMaskIntoConstraints = false
        
        variantTestLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateTestLabel.translatesAutoresizingMaskIntoConstraints = false
        
        markTestLabel.translatesAutoresizingMaskIntoConstraints = false
        
        prevTestsButton.setTitle("Предыдущие работы", for: .normal)
        prevTestsButton.layer.borderWidth = 1
        prevTestsButton.layer.cornerRadius = 30
        prevTestsButton.addTarget(self, action: #selector(prevTestsButtonTapped), for: .touchUpInside)
        prevTestsButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubViews(){
        view.addSubview(profileImageView)
        view.addSubview(fioLabel)
        view.addSubview(groupLabel)
        view.addSubview(resultsLabel)
        view.addSubview(nameTestLabel)
        view.addSubview(variantTestLabel)
        view.addSubview(dateTestLabel)
        view.addSubview(markTestLabel)
        view.addSubview(prevTestsButton)
    }
    
    func activateConstraints(){
        NSLayoutConstraint.activate([
            
        
        
        
        
        
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        confingScreen()
        addSubViews()
        activateConstraints()
        
    }
    
    func setFio(fio: String){
        fioLabel.text = fio
    }
    
    func setGroup(group: String){
        groupLabel.text = group
    }
    
    func setTestName(testName: String = ""){
        nameTestLabel.text = "Название: \(testName)"
    }
    
    func setTestVariant(testVariant: String = "" ){
        variantTestLabel.text = "Вариант: \(testVariant)"
    }
    
    func setTestDate(testDate: String = ""){
        dateTestLabel.text = "Дата: \(dateTestLabel)"
    }
    
    func setTestMark(testMark: String = "" ){
        markTestLabel.text = "Оценка: \(testMark)"
    }
    @objc
    func prevTestsButtonTapped(){
        let prevTestList = PreviousTestsList()
        prevTestList.modalPresentationStyle = .fullScreen
        show(prevTestList, sender: self)
        
    }
}

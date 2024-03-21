//
//  ProfileViewController.swift
//  uir
//
//  Created by Александр  Сухинин on 19.03.2024.
//

import UIKit
//TODO: сделать отдельный лейбел для фио, группы чтобы было ФИО: жирным а сама фамилия обычным + желательно шрифтпо красивее и можно наверное что-то придумать с цветом фона и таб бара
final class ProfileViewController: UIViewController{
    let profileImageView = UIImageView()
    let fioLabel = UILabel()
    let groupLabel = UILabel()
    let resultsLabel = UILabel()
    let nameTestLabel = UILabel()
    let variantTestLabel = UILabel()
    let dateTestLabel = UILabel()
    let markTestLabel = UILabel()
    let resultsView = UIView()
    let profileDataView = UIView()
    let testDataView = UIView()
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
        
        profileDataView.backgroundColor = UIColor(named: "blueForViews")
        profileDataView.layer.borderWidth = 1
        profileDataView.layer.cornerRadius = 30
        profileDataView.translatesAutoresizingMaskIntoConstraints = false
    
        resultsView.backgroundColor = UIColor(named: "blueForViews")
        resultsView.layer.borderWidth = 1
        resultsView.layer.cornerRadius = 30
        resultsView.translatesAutoresizingMaskIntoConstraints = false
        
        testDataView.backgroundColor = UIColor(named: "blueForViews")
        testDataView.layer.borderWidth = 1
        testDataView.layer.cornerRadius = 30
        testDataView.translatesAutoresizingMaskIntoConstraints = false
        
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
   
        
        fioLabel.translatesAutoresizingMaskIntoConstraints = false

        
        groupLabel.translatesAutoresizingMaskIntoConstraints = false
        
        resultsLabel.textAlignment = .center
        resultsLabel.text = "Результаты"
        resultsLabel.translatesAutoresizingMaskIntoConstraints = false

        nameTestLabel.translatesAutoresizingMaskIntoConstraints = false
        
        variantTestLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateTestLabel.translatesAutoresizingMaskIntoConstraints = false
        
        markTestLabel.translatesAutoresizingMaskIntoConstraints = false
        
        prevTestsButton.setTitle("Предыдущие работы", for: .normal)
        prevTestsButton.setTitleColor(.black, for: .normal)
        prevTestsButton.backgroundColor = UIColor(named: "blueForViews")
        prevTestsButton.layer.borderWidth = 1
        prevTestsButton.layer.cornerRadius = 20
        prevTestsButton.addTarget(self, action: #selector(prevTestsButtonTapped), for: .touchUpInside)
        prevTestsButton.translatesAutoresizingMaskIntoConstraints = false
    }
    func setMockData(){
        fioLabel.text = "ФИО: Сухинин А.А."
        groupLabel.text = "Группа: Б21-524"
        profileImageView.image = UIImage(named: "meanStudent")
        nameTestLabel.text = "Название: Прямой вывод"
        variantTestLabel.text = "Вариант: 21"
        dateTestLabel.text = "Дата: 11.12.2023"
        markTestLabel.text = "Оценка: 96"
        
    }
    func addSubViews(){
        view.addSubview(prevTestsButton)
        view.addSubview(profileDataView)
        view.addSubview(resultsView)
        view.addSubview(testDataView)
        
        profileDataView.addSubview(profileImageView)
        profileDataView.addSubview(fioLabel)
        profileDataView.addSubview(groupLabel)

        resultsView.addSubview(resultsLabel)

        testDataView.addSubview(nameTestLabel)
        testDataView.addSubview(variantTestLabel)
        testDataView.addSubview(dateTestLabel)
        testDataView.addSubview(markTestLabel)
        
    }
    
    func activateConstraints(){
        NSLayoutConstraint.activate([
            profileDataView.widthAnchor.constraint(equalToConstant: 360),
            profileDataView.heightAnchor.constraint(equalToConstant: 158),
            profileDataView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            profileDataView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
           
            profileImageView.centerYAnchor.constraint(equalTo: profileDataView.centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: profileDataView.leadingAnchor, constant: 5),
            profileImageView.widthAnchor.constraint(equalToConstant: 135),
            profileImageView.heightAnchor.constraint(equalToConstant: 145.02),
            
            fioLabel.topAnchor.constraint(equalTo: profileDataView.topAnchor, constant: 60),
            fioLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            fioLabel.widthAnchor.constraint(equalToConstant: 158),
            fioLabel.heightAnchor.constraint(equalToConstant: 26),
            
            groupLabel.topAnchor.constraint(equalTo: fioLabel.bottomAnchor, constant: 5),
            groupLabel.leadingAnchor.constraint(equalTo: fioLabel.leadingAnchor),
            groupLabel.widthAnchor.constraint(equalToConstant: 158),
            groupLabel.heightAnchor.constraint(equalToConstant: 26),
            
            resultsView.centerXAnchor.constraint(equalTo: testDataView.centerXAnchor),
            resultsView.bottomAnchor.constraint(equalTo: testDataView.topAnchor,constant: 23),
            resultsView.widthAnchor.constraint(equalToConstant: 260),
            resultsView.heightAnchor.constraint(equalToConstant: 50),
            
            resultsLabel.topAnchor.constraint(equalTo: resultsView.topAnchor,constant: 5),
            resultsLabel.leadingAnchor.constraint(equalTo: resultsView.leadingAnchor, constant: 30),
            resultsLabel.widthAnchor.constraint(equalToConstant: 200),

            testDataView.widthAnchor.constraint(equalToConstant: 360),
            testDataView.heightAnchor.constraint(equalToConstant: 180),
            testDataView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            testDataView.topAnchor.constraint(equalTo: profileDataView.bottomAnchor,constant: 70),

            nameTestLabel.leadingAnchor.constraint(equalTo: testDataView.leadingAnchor, constant: 15),
            nameTestLabel.topAnchor.constraint(equalTo: testDataView.topAnchor, constant: 20),
            nameTestLabel.widthAnchor.constraint(equalToConstant: 300),
            
            variantTestLabel.leadingAnchor.constraint(equalTo: testDataView.leadingAnchor, constant: 15),
            variantTestLabel.topAnchor.constraint(equalTo: nameTestLabel.bottomAnchor, constant: 20),
            variantTestLabel.widthAnchor.constraint(equalToConstant: 200),
            
            dateTestLabel.leadingAnchor.constraint(equalTo: testDataView.leadingAnchor, constant: 15),
            dateTestLabel.topAnchor.constraint(equalTo: variantTestLabel.bottomAnchor, constant: 20),
            dateTestLabel.widthAnchor.constraint(equalToConstant: 200),
            
            markTestLabel.leadingAnchor.constraint(equalTo: testDataView.leadingAnchor, constant: 15),
            markTestLabel.topAnchor.constraint(equalTo: dateTestLabel.bottomAnchor, constant: 20),
            markTestLabel.widthAnchor.constraint(equalToConstant: 200),
            
            prevTestsButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            prevTestsButton.widthAnchor.constraint(equalToConstant: 200),
            prevTestsButton.topAnchor.constraint(equalTo: testDataView.bottomAnchor, constant: 50),
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        confingScreen()
        addSubViews()
        activateConstraints()
        setMockData()
        
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
        show(prevTestList, sender: self)

        
    }
}

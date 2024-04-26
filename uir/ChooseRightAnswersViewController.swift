//
//  ChoseRightAnswersViewController.swift
//  uir
//
//  Created by Александр  Сухинин on 26.04.2024.
//

import UIKit

final class ChoseRightAnswersViewController: UIViewController{
    private let inputArr = ["123","13","1413","4143","1535","51351235","53521541","41341","413341","153531315","1345351235","1535135135513"]
    private var outputArr: [String]  = []
    private let tableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.layer.cornerRadius = 10
        return tableView
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}


extension ChoseRightAnswersViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputArr.count
    }
    
}



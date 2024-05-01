import UIKit

class WordPairTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let russianWords = ["Кошка", "Собака", "Дом", "Машина"]
    var englishWords = ["Cat", "Dog", "House", "Car"]
    
    var selectedPairs: [(String, String)] = []
    
    lazy var russianTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RussianCell")
        return tableView
    }()
    
    lazy var englishTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "EnglishCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func setupViews() {
        russianTableView.frame = CGRect(x: 0, y: 0, width: view.frame.width / 2, height: view.frame.height)
        view.addSubview(russianTableView)
        englishTableView.isEditing = true
        englishTableView.frame = CGRect(x: view.frame.width / 2, y: 0, width: view.frame.width / 2, height: view.frame.height)
        view.addSubview(englishTableView)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == russianTableView {
            return russianWords.count
        } else {
            return englishWords.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableView == russianTableView ? "RussianCell" : "EnglishCell", for: indexPath)
        
        if tableView == russianTableView {
            cell.textLabel?.text = russianWords[indexPath.row]
        } else {
            cell.textLabel?.text = englishWords[indexPath.row]
        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == russianTableView {
           getPairs()
        }
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editingActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if tableView == englishTableView {
            let moveAction = UITableViewRowAction(style: .normal, title: "Переместить") { (action, indexPath) in
                // Выполнить действие перемещения
                
            }
            
            return [moveAction]
        }else{
            return nil
        }
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if tableView == englishTableView {
            let removedElement = englishWords.remove(at: sourceIndexPath.row)
            englishWords.insert(removedElement, at: destinationIndexPath.row)
        }
    }
    func getPairs() -> [(String,String)]{
        var arr: [(String,String)] = []
        for i in 0..<englishWords.count{
            arr.append((russianWords[i],englishWords[i]))
        }
        print(arr)
        return arr
    }
}

import UIKit

class ScaleViewController: UIViewController {
    private let arr = ["Отображение задачи в математическую модель","Постановка задачи","Автоматическая трансляция во внутренний язык ЭВМ","Трансляция модели в программу на языке высокого уровня","AFs afds DSFSFD"]

    private let headerView = UIView()
    private let blockView = UIView()
    private let tableView = UITableView()
    private let sendButton = UIButton()
    
    private let headerLabel = UILabel()
    private let givenLabel = UILabel()
    
    private let headerWidth: CGFloat = 350
    private let headerHeight: CGFloat = 50
    private let blockWidth: CGFloat = 350
    private let smallBlockHeight: CGFloat = 30
    private let smallBlockIndent: CGFloat = 15
    private let sendButtonHeight: CGFloat = 50
    private let buttonWidth: CGFloat = 150

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        tableView.dataSource = self
        tableView.register(LiqueurCell.self, forCellReuseIdentifier: "liqueurCell")

        configViews()
        addTargets()
        addSubViews()

    }
    
    init(task: String){
        givenLabel.text = task
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        givenLabel.text = ""
        super.init(coder: coder)
    }
    
    private func configViews() {
        headerView.backgroundColor = .gray
        blockView.backgroundColor = .lightGray
        sendButton.backgroundColor = .blue
        
        headerLabel.text = "Liqueur Scale"
        headerLabel.font = UIFont.systemFont(ofSize: 20)
        headerLabel.textAlignment = .center
        
        givenLabel.text = "Given"
        givenLabel.font = UIFont.systemFont(ofSize: 15)
    }
    
    private func addTargets() {
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }

    private func addSubViews() {
        view.addSubview(headerView)
        headerView.addSubview(headerLabel)
        
        view.addSubview(blockView)
        blockView.addSubview(givenLabel)
        
        view.addSubview(tableView)
        view.addSubview(sendButton)
    }
    
    private func applyConstraints() {
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
            
            sendButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 15),
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
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
    
    @objc private func sendButtonTapped() {
        // TODO: Implement send button functionality
    }
}

extension ScaleViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "liqueurCell", for: indexPath) as? LiqueurCell else{
            return UITableViewCell()
        }
        let text = arr[indexPath.row]
        cell.configCell(text: text)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}

////
////  SelectCoffeeViewController.swift
////  CafeRubika
////
////  Created by Reza Kashkoul on 16-Tir-1401 .
////
//
//import UIKit
//
//class SelectCoffeeViewController: UIViewController {
//    
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var tableView: UITableView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupUI()
//    }
//    
//    func setupUI() {
//        setupTableView()
//        navigationController?.navigationBar.prefersLargeTitles = true
//        title = "Brew with Lex"
//        titleLabel.text = "Select your style"
//    }
//    
//    func setupTableView() {
//        tableView.register(UINib(nibName: "CoffeeTableViewCell", bundle: nil), forCellReuseIdentifier: "CoffeeTableViewCell")
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.separatorStyle = .none
//    }
//    
//}
//
////MARK: - TableView Functions:
//extension SelectCoffeeViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTableViewCell", for: indexPath) as! CoffeeTableViewCell
//        cell.setupCell(itemImage: <#T##String#>, itemLabel: <#T##String#>)
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//    
//    
//}

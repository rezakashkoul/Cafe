//
//  CoffeeExtraViewController.swift
//  CafeRubika
//
//  Created by Reza Kashkoul on 18-Tir-1401 .
//

import UIKit

class CoffeeExtraViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var subData: [Subselection] = []
    var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.slideUpViews(delay: 0.3)
    }
    
    func setupUI() {
        setupTableView()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Select your extra's"
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Brew with Lex", style: .plain, target: nil, action: nil)
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "ExtraTableViewCell", bundle: nil), forCellReuseIdentifier: "ExtraTableViewCell")
        tableView.register(UINib(nibName: "SubSelectionDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "SubSelectionDetailsTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
}

//MARK: - TableView Functions:
extension CoffeeExtraViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExtraTableViewCell", for: indexPath) as! ExtraTableViewCell
        if let coffee = coffee {
            for i in 0...data.count-1 {
                for extra in coffee.extras {
                    if extra.name == data[i] {
                        subData = extra.subselections
                    }
                }
            }
        }
        cell.setupCell(itemLabel: data[indexPath.row])
        cell.subData = subData
//      cell.tableStackView.isHidden = cellIsClicked ? false : true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let coffee = coffee else { return }
        
        for i in 0...coffee.extras.count-1 {
            for id in coffee.types[indexPath.row].extras {
                if coffee.extras[i].id == id {
//                    extras.append(coffee.extras[i].name)
                    if coffee.extras[i].id == order.coffeeExtra {
                        subData = coffee.extras[i].subselections
                    }
                }
            }
        }
        let indexPath = IndexPath(row: indexPath.row, section: 0)
        tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.fade)
    }
}

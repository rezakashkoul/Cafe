//
//  CoffeeSizeViewController.swift
//  CafeRubika
//
//  Created by Reza Kashkoul on 18-Tir-1401 .
//

import UIKit

class CoffeeSizeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
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
        title = "Select your size"
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Brew with Lex", style: .plain, target: nil, action: nil)
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "CoffeeTableViewCell", bundle: nil), forCellReuseIdentifier: "CoffeeTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
}

//MARK: - TableView Functions:
extension CoffeeSizeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTableViewCell", for: indexPath) as! CoffeeTableViewCell
        cell.setupCell(itemLabel: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let coffee = coffee else { return }
        var extras: [Extra] = []
        
        for i in 0...coffee.extras.count-1 {
            for id in coffee.types[indexPath.row].extras {
                if coffee.extras[i].id == id {
                    extras.append(coffee.extras[i])
                }
            }
        }
        order.coffeeSize = coffee.sizes.compactMap({$0.id})[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "CoffeeExtraViewController") as! CoffeeExtraViewController
        vc.data = extras
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

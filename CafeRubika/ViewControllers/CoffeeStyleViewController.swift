//
//  CoffeeStyleViewController.swift
//  CafeRubika
//
//  Created by Reza Kashkoul on 16-Tir-1401 .
//

import UIKit

class CoffeeStyleViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var data: [String] = [] {
        didSet {
            DispatchQueue.main.async {[weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        data = coffee?.types.compactMap({$0.name}) ?? []
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.slideUpViews(delay: 0.3)
    }
    
    func setupUI() {
        setupTableView()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Select your style"
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
extension CoffeeStyleViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        
        var sizes: [String] = []
        for i in 0...coffee.sizes.count-1 {
            for id in coffee.types[indexPath.row].sizes {
                if coffee.sizes[i].id == id {
                    sizes.append(coffee.sizes[i].name)
                }
            }
        }
//        data = coffee.types.filter({$0.id == order.coffeStyle})[indexPath.row].sizes
        order.coffeStyle =  coffee.types.compactMap({$0.id})[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "CoffeeSizeViewController") as! CoffeeSizeViewController
        vc.data = sizes
        navigationController?.pushViewController(vc, animated: true)
    }
}

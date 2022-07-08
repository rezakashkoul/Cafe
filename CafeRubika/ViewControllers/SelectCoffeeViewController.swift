//
//  SelectCoffeeViewController.swift
//  CafeRubika
//
//  Created by Reza Kashkoul on 16-Tir-1401 .
//

import UIKit

class SelectCoffeeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var data: [String] = []
    var sizes: [String] = []
    var extras: [String] = []
    var flag = false
    
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
        title = "Brew with Lex"
        titleLabel.text = "Select your style"
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "CoffeeTableViewCell", bundle: nil), forCellReuseIdentifier: "CoffeeTableViewCell")
        tableView.register(UINib(nibName: "ExtraTableViewCell", bundle: nil), forCellReuseIdentifier: "ExtraTableViewCell")
        tableView.register(UINib(nibName: "SubSelectionDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "SubSelectionDetailsTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
}

//MARK: - TableView Functions:
extension SelectCoffeeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if !flag {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTableViewCell", for: indexPath) as! CoffeeTableViewCell
            cell.setupCell(itemImage: "", itemLabel: data[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExtraTableViewCell", for: indexPath) as! ExtraTableViewCell
            cell.itemLabel.text = data[indexPath.row]
            //extras[indexPath.row]
            cell.subData = data
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let coffee = coffee else { return }
        let sizeIds = coffee.types[indexPath.row].sizes
        let extrasIds = coffee.types[indexPath.row].extras
        
        if sizes.isEmpty {
            for i in 0...coffee.sizes.count-1 {
                for id in sizeIds {
                    if coffee.sizes[i].id == id {
                        sizes.append(coffee.sizes[i].name)
                    }
                }
            }
            data = sizes
            titleLabel.text = "Select your size"
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
            return
        } else if !sizes.isEmpty && extras.isEmpty {
            for i in 0...coffee.extras.count-1 {
                for id in extrasIds {
                    if coffee.extras[i].id == id {
                        extras.append(coffee.extras[i].name)
                    }
                }
            }
            data = extras
            titleLabel.text = "Select your extra's"
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        } else if !extras.isEmpty {
            flag = true
            var subData: [String] = []
            for i in 0...coffee.extras.count-1 {
                for id in extrasIds {
                    if coffee.extras[i].id == id {
                        subData.append(coffee.extras[i].subselections[0].name)
                    }
                }
            }
            self.data = subData
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if flag {
            return CGFloat(data.count * 130)
            
        } else {
            return UITableView.automaticDimension
        }
    }
    
}

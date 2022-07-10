//
//  CoffeeExtraViewController.swift
//  CafeRubika
//
//  Created by Reza Kashkoul on 18-Tir-1401 .
//

import UIKit

class CoffeeExtraViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [Extra] = []
    
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
        tableView.register(UINib(nibName: "ExtraDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "ExtraDetailTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
}

//MARK: - TableView Functions:
extension CoffeeExtraViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].subselections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExtraDetailTableViewCell", for: indexPath) as! ExtraDetailTableViewCell
        
        if let buttonIsChecked = data[indexPath.section].subselections[indexPath.row].isSelected {
            let buttonImage = buttonIsChecked ? "box_filled" : "box"
            cell.checkBoxButton.setImage(UIImage(named: buttonImage), for: .normal)
        }
        cell.itemLabel.text = data[indexPath.section].subselections[indexPath.row].name
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].name
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 16, y: 8, width: tableView.frame.width - 32, height: 98))
        view.backgroundColor = UIColor(red: 174/255, green: 215/255, blue: 160/255, alpha: 1)
        let label = UILabel(frame: CGRect(x: 16, y: 25, width: view.frame.width - 16, height: 50))
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.white
        label.text = data[section].name
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 98
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        order.coffeeExtra = data[indexPath.section].subselections[indexPath.row].id
        for j in 0...data[indexPath.section].subselections.count-1 {
            data[indexPath.section].subselections[j].isSelected = false
        }
        data[indexPath.section].subselections[indexPath.row].isSelected = true
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

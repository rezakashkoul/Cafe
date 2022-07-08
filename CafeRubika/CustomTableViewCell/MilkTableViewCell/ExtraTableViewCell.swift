//
//  ExtraTableViewCell.swift
//  CafeRubika
//
//  Created by Reza Kashkoul on 16-Tir-1401 .
//

import UIKit

class ExtraTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var subData: [String]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        itemImage.layer.cornerRadius = bounds.height / 2
        itemImage.clipsToBounds = true
        setupTableView()
    }
    
    func setupCell(itemImage: String, itemLabel: String) {
        self.itemImage.image = UIImage(named: itemImage)
        self.itemLabel.text = itemLabel
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SubSelectionDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "SubSelectionDetailsTableViewCell")
        self.tableView.separatorStyle = .none
        self.tableView.reloadData()
    }
    
}

//MARK: - TableView Functions:
extension ExtraTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubSelectionDetailsTableViewCell", for: indexPath) as! SubSelectionDetailsTableViewCell
        cell.itemLabel.text = subData?[indexPath.row]
        return cell
    }
    
}

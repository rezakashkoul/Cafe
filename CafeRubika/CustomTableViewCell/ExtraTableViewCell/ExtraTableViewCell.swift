//
//  ExtraTableViewCell.swift
//  CafeRubika
//
//  Created by Reza Kashkoul on 16-Tir-1401 .
//

import UIKit

class ExtraTableViewCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableStackView: UIStackView!
    
    var subData: [Subselection]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var cellIsClicked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        setupTableView()
        self.selectionStyle = .none
    }
    
    func setupCell(itemLabel: String) {
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
        cell.delegate = self
        cell.setupCell(itemLabel: subData?[indexPath.row].name ?? "", itemCheckBoxButton: cellIsClicked ? "box" : "box_filled")
        return cell
    }
    
}

extension ExtraTableViewCell: SubSelectionDetailsTableViewCellDelegate {
    
    func cellIsCollapse(state: Bool) {
        cellIsClicked = state
    }
    
}

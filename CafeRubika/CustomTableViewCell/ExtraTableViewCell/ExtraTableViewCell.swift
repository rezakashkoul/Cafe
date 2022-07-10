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
    
    var cellIsClicked = false
    var subData: [Subselection]? {
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
//        setupTableView()
        self.selectionStyle = .none
    }
    
    func setupCell(itemLabel: String) {
        self.itemLabel.text = itemLabel
    }
}

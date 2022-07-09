//
//  SubSelectionDetailsTableViewCell.swift
//  CafeRubika
//
//  Created by Reza Kashkoul on 16-Tir-1401 .
//

import UIKit

class SubSelectionDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        selectionStyle = .none
    }
    
    func setupCell(itemLabel: String) {
        self.itemLabel.text = itemLabel
    }
    
}

//
//  SubSelectionDetailsTableViewCell.swift
//  CafeRubika
//
//  Created by Reza Kashkoul on 16-Tir-1401 .
//

import UIKit

class SubSelectionDetailsTableViewCell: UITableViewCell {

//    @IBOutlet weak var itemCheckBox: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        setupUI()
        selectionStyle = .none
    }
    
//    private func setupUI() {
//        itemImage.layer.cornerRadius = bounds.height / 2
//        itemImage.clipsToBounds = true
//    }
//
//    func setupCell(itemImage: String, itemLabel: String) {
//        self.itemImage.image = UIImage(named: itemImage)
//        self.itemLabel.text = itemLabel
//    }
    
}

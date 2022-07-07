//
//  CoffeeTableViewCell.swift
//  CafeRubika
//
//  Created by Reza Kashkoul on 16-Tir-1401 .
//

import UIKit

class CoffeeTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        itemImage.layer.cornerRadius = bounds.height / 2
        itemImage.clipsToBounds = true
    }
    
    func setupCell(itemImage: String, itemLabel: String) {
        self.itemImage.image = UIImage(named: itemImage)
        self.itemLabel.text = itemLabel
    }
     
}

//
//  ExtraDetailTableViewCell.swift
//  CafeRubika
//
//  Created by Reza Kashkoul on 19-Tir-1401 .
//

import UIKit

class ExtraDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    
    @IBAction func checkBoxButtonAction(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkBoxButton.setTitle("", for: .normal)
    }

    
}

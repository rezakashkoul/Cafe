//
//  SubSelectionDetailsTableViewCell.swift
//  CafeRubika
//
//  Created by Reza Kashkoul on 16-Tir-1401 .
//

import UIKit

protocol SubSelectionDetailsTableViewCellDelegate: AnyObject {
    func cellIsCollapse(state: Bool)
}

class SubSelectionDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemCheckBoxButton: UIButton!
    
    @IBAction func itemCheckBoxButtonAction(_ sender: Any) {
        delegate?.cellIsCollapse(state: true)
    }
    
    weak var delegate: SubSelectionDetailsTableViewCellDelegate? = nil
    var checkBoxButtonImage = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        selectionStyle = .none
    }
    
    func setupCell(itemLabel: String, itemCheckBoxButton: String) {
        self.itemLabel.text = itemLabel
        self.itemCheckBoxButton.setImage(UIImage(named: checkBoxButtonImage), for: .normal)
    }
    
}

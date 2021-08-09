//
//  InsertCell.swift
//  APIEndpoint
//
//  Created by mbp on 26/3/2021.
//

import UIKit

class InsertCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fill(with model: PassData) {
        titleLabel.text = model.timeStamp.toDateString()
        contentLabel.text = model.data.toString()
    }

}

//
//  DetailCell.swift
//  APIEndpoint
//
//  Created by mbp on 26/3/2021.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    func fill(with model: Mirror.Child) {
        titleLabel.text = model.label
        contentLabel.text = model.value as? String
    }

}

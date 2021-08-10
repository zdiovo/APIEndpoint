//
//  HistoryCell.swift
//  HistoryCell
//
//  Created by os001 on 2021/8/10.
//

import UIKit

class HistoryCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    func fill(with obj: PassData) {
        titleLabel.text = obj.timeStamp.toDateString()
    }

}

//
//  MainCell.swift
//  Doyduk
//
//  Created by Yusuf burak elkan on 14.05.2022.
//

import UIKit

class MainCell: UITableViewCell {
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var catLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

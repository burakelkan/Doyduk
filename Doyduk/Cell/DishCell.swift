//
//  DishCell.swift
//  Doyduk
//
//  Created by Yusuf burak elkan on 15.05.2022.
//

import UIKit

class DishCell: UITableViewCell {

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configCell(model: Dish) {
        nameLabel.text = model.name
        descLabel.text = model.description
        priceLabel.text = "\(model.price) TL"
        dishImageView.kf.setImage(with: URL(string: model.image_url))
    }
}

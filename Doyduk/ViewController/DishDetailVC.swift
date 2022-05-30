//
//  DishDetailVC.swift
//  Doyduk
//
//  Created by Yusuf burak elkan on 15.05.2022.
//

import UIKit
import Kingfisher

class DishDetailVC: UIViewController {
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishPrice: UILabel!
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var dishDesc: UILabel!
    @IBOutlet weak var dishNameView: UIView!
    var dishId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Desing()
        setupUI()
    }
    func Desing(){
        title = "Doyduk"
        dishNameView.layer.cornerRadius = 25
        dishNameView.layer.borderWidth = 1.0
        dishNameView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        dishImageView.layer.cornerRadius = 20
    }
    func setupUI() {
        
        API.getDishesDetail(id: dishId) { dish in
            DispatchQueue.main.async {
                self.dishImageView.kf.setImage(with: URL(string: dish.result.image_url))
                self.dishPrice.text = "\(dish.result.price) TL"
                self.dishName.text = dish.result.name
                self.dishDesc.text = dish.result.description
            }
        }
    }
}

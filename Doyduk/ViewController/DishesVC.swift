//
//  DishesVC.swift
//  Doyduk
//
//  Created by Yusuf burak elkan on 15.05.2022.
//

import UIKit
import Kingfisher

class DishesVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var titleString = ""
    var dishArray = [Dish]()
    var dish: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      TableView()
    }
    func TableView(){
        title = "Doyduk"
        titleLabel.text = titleString
        
        tableView.delegate = self
        tableView.dataSource = self
        
        API.getDishesData { dishes in
            self.dishArray = dishes.result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            let vc = segue.destination as! DishDetailVC
            vc.dishId = dish
        }
    }
}

extension DishesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DishCell
        cell.configCell(model: dishArray[indexPath.row])
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 4.0
        cell.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dish = dishArray[indexPath.row].id
        performSegue(withIdentifier: "detail", sender: self)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

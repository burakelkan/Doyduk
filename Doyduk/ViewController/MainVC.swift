//
//  MainVC.swift
//  Doyduk
//
//  Created by Yusuf burak elkan on 14.05.2022.
//

import UIKit
import Kingfisher

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tabelView: UITableView!
    @IBOutlet weak var sefim: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var nameAndTableNo = ""
    var categories = [Category]()
    var catName = ""
    var nameis: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = "Hoş Geldin \(nameis!) "
        Desing()
        TableView()
    }
    func Desing(){
        sefim.layer.cornerRadius = 20
        sefim.layer.borderWidth = 1.0
        tabelView.layer.cornerRadius = 15
    }
    func TableView(){
        tabelView.delegate = self
        tabelView.dataSource = self
        API.getCategoryData { model in
            self.categories = model.result
            DispatchQueue.main.async {
                self.tabelView.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainCell
        cell.catLabel.text = categories[indexPath.row].prefix + " " + categories[indexPath.row].name
        let url = URL(string: categories[indexPath.row].img_url)
        cell.catImageView.kf.setImage(with: url!)
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 4.0
        cell.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        catName = categories[indexPath.row].name
        performSegue(withIdentifier: "toDetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let vc = segue.destination as! DishesVC
            vc.titleString = catName
        }
    }
}

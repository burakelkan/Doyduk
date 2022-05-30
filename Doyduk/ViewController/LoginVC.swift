//
//  LoginVC.swift
//  Doyduk
//
//  Created by Yusuf burak elkan on 14.05.2022.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var tableNoTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        desing()
    }
    
    func desing(){
        nameTextField.layer.cornerRadius = 15.0
        nameTextField.layer.borderWidth = 1.0
        nameTextField.layer.borderColor = UIColor.black.cgColor
        
        tableNoTextField.layer.cornerRadius = 15.0
        tableNoTextField.layer.borderWidth = 1.0
        tableNoTextField.layer.borderColor = UIColor.black.cgColor
        
        loginButton.layer.cornerRadius = 25
        loginButton.layer.borderWidth = 1.0
        loginButton.layer.borderColor = #colorLiteral(red: 0.9098039216, green: 0.2980392157, blue: 0.3098039216, alpha: 1)
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(nameTextField.text, forKey: "name")
        performSegue(withIdentifier: "toMain", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMain" {
            let destVC = segue.destination as! MainVC
            destVC.nameAndTableNo = nameTextField.text! + tableNoTextField.text!
            destVC.nameis = nameTextField.text
        }
    }
}

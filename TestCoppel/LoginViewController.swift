//
//  ViewController.swift
//  TestCoppel
//
//  Created by catalina lozano on 07/07/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func loginTapped(_ sender: Any) {
        validateFields()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signUp")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    //Mark:- functions
    func saludo()->String{
        var nombre: String
        nombre = email.text!
        return nombre
    }
    
      func validateFields(){
          if email.text?.isEmpty == true {
              let alert = UIAlertController(title: "Alert!", message: "Favor de ingresar email", preferredStyle: .alert)
              let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
              alert.addAction(action)
              DispatchQueue.main.async {
                  self.present(alert, animated: true, completion: nil)
          }
              print("No email text")
              return
          }
          if password.text?.isEmpty == true {
              let alert = UIAlertController(title: "Alert!", message: "Favor de ingresar password", preferredStyle: .alert)
              let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
              alert.addAction(action)
              DispatchQueue.main.async {
                  self.present(alert, animated: true, completion: nil)
          }
              print("No password")
              return
          }
          login()
      }
      func login(){
          Auth.auth().signIn(withEmail: email.text!, password: password.text!) { [weak self] authResult, err in
              
              guard let strongSelf = self else {return}
              if let err = err {
                  self?.errorLbl.text = err.localizedDescription
                  print(err.localizedDescription)
              }
              self!.checkUserInfo()
          }
      }
      func checkUserInfo(){
          if Auth.auth().currentUser != nil {
              let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let vc = storyboard.instantiateViewController(withIdentifier: "mainHome")
              vc.modalPresentationStyle = .overFullScreen
              present(vc, animated: true)
          }
      }
}


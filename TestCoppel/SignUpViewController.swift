//
//  SignUpViewController.swift
//  TestCoppel
//
//  Created by catalina lozano on 07/07/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signUpTapped(_ sender: Any) {
        if email.text?.isEmpty == true {
            let alert = UIAlertController(title: "Alert!", message: "Favor de ingresar email", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
        }
            print("No text in email field")
            return
        }
        if password.text?.isEmpty == true {
            let alert = UIAlertController(title: "Alert!", message: "Favor de ingresar password", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
        }
            print("No text in password field")
            return
        }
        signUp()
    }
    
    @IBAction func alreadyHaveTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    func signUp(){
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { authResult, error in
            guard let user = authResult?.user, error == nil else {
                print("error \(error?.localizedDescription)")
                return
            }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "mainHome")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }
}

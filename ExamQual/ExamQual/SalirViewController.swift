//
//  SalirViewController.swift
//  ExamQual
//
//  Created by catalina lozano on 10/07/22.
//

import UIKit

class SalirViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backPress(_ sender: Any) {
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "LoginViewController")
        self.present(vc, animated: true, completion: nil)
        
    }
    

}

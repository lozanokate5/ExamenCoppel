//
//  DetalPopularViewController.swift
//  ExamQual
//
//  Created by catalina lozano on 09/07/22.
//

import UIKit

class DetalPopularViewController: UIViewController {
    
    
    @IBOutlet weak var imagenImg: UIImageView!
    @IBOutlet weak var tituloLbl: UILabel!
    @IBOutlet weak var fechaLbl: UILabel!
    @IBOutlet weak var idiomaLbl: UILabel!
    @IBOutlet weak var conteoLbl: UILabel!
    @IBOutlet weak var sinopsisLbl: UILabel!
    
    var imagenI = UIImage()
    var tit = ""
    var fec = ""
    var idiom = ""
    var cont = 0
    var sinop = ""
    
    var serv = Servicio()
    
    var myResult: [Results]?{
        didSet{
            DispatchQueue.main.async { [self] in
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.serv.apicall2 { (x) in
            print(x.page)
            print(x.results)
            self.myResult = x.results
        }
        
        imagenImg.image = imagenI
        tituloLbl.text = tit
        fechaLbl.text = fec
        idiomaLbl.text = idiom
        sinopsisLbl.text = sinop
        
        let contar: String = String(describing: cont)
        conteoLbl.text = contar
        
    }
    

    
}

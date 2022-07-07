//
//  DetailPopularVC.swift
//  TestCoppel
//
//  Created by catalina lozano on 07/07/22.
//

import UIKit

class DetailPopularVC: UIViewController {
    
    
    @IBOutlet weak var img: UIImageView!    
    @IBOutlet weak var tituloLbl: UILabel!
    
    @IBOutlet weak var fecha: UILabel!
   // @IBOutlet weak var votos: UILabel!
    @IBOutlet weak var popular: UILabel!
    @IBOutlet weak var conteo: UILabel!
    @IBOutlet weak var resumen: UILabel!
    
    var lang = ""
    var x = ""
    var imagen = UIImage()
    
    var fech = ""
    var vot = ""
    var popu = ""
    
    var cont = 0
    var resum = ""
    /*
     let original_language: String
        let original_title : String?
        let overview : String?
        let release_date : String?
        let poster_path : String?
        let vote_average : Float?
        let popularity: Float?
        let vote_count: Int?

     */
    
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
        tituloLbl.text = x
        img.image = imagen
        fecha.text = fech
        
        let strb: String = String(describing:vot)
        //votos.text = strb
        
        let populy: String = String(describing:popu)
       // popular.text = populy
        
        let strx: String = String(describing: cont)
        conteo.text = strx
        
        resumen.text = resum
        
        popular.text = lang
    }
    
    
    

}

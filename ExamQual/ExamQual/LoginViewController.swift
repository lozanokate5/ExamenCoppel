//
//  LoginViewController.swift
//  ExamQual
//
//  Created by catalina lozano on 09/07/22.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtclave: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func btnClick(_ sender: Any) {
       /* let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "mainHome")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)*/
        
        let delegado = UIApplication.shared.delegate as! AppDelegate
        let contexto = delegado.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuarios")
        let predicados = NSPredicate(format: "%K == %@ AND %K == %@", argumentArray: ["usuario", txtUsuario.text!, "clave", txtclave.text!])
        request.predicate = predicados
        
        do{
            let resultado = try contexto.fetch(request) as! [NSManagedObject]
            if resultado.count == 1
            {
                /*performSegue(withIdentifier: "segueSiguiente", sender: self)*/
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                 let vc = storyboard.instantiateViewController(withIdentifier: "mainHome")
                 vc.modalPresentationStyle = .overFullScreen
                 present(vc, animated: true)
            } else {
                let ventana = UIAlertController(title: "Error", message: "Error de autenticacion", preferredStyle: .alert)
                let accionOk = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                ventana.addAction(accionOk)
                self.present(ventana, animated: true, completion: nil)
            }
            
        }catch {
            
        }
        
    }
}

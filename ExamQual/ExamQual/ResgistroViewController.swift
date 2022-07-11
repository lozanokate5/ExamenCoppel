//
//  ResgistroViewController.swift
//  ExamQual
//
//  Created by catalina lozano on 10/07/22.
//

import UIKit
import CoreData

class ResgistroViewController: UIViewController {

    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtClave: UITextField!
    @IBOutlet weak var txtConfirmaClave: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveClick(_ sender: Any) {
        if txtClave.text != txtConfirmaClave.text{
            mostrarCuadroDialogo(titulo: "Error", mensaje: "Claves no coinciden")
        }
        else {
            let delegado = UIApplication.shared.delegate as! AppDelegate
            let contexto = delegado.persistentContainer.viewContext
            let entidad = NSEntityDescription.insertNewObject(forEntityName: "Usuarios", into: contexto)
            entidad.setValue(txtUsuario.text, forKey: "usuario")
            entidad.setValue(txtClave.text, forKey: "clave")
            entidad.setValue(txtCorreo.text, forKey: "correo")
            do{
                try contexto.save()
                dismiss(animated: true, completion: nil)
            }catch {
                mostrarCuadroDialogo(titulo: "Error", mensaje: "Error al registrar el usuario")
            }
        }
        
    }
    
    @IBAction func regresarClick(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func mostrarCuadroDialogo(titulo: String, mensaje:String){
        let ventana = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let accionOk = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        ventana.addAction(accionOk)
        self.present(ventana, animated: true, completion: nil)
    }
}

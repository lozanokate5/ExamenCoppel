//
//  PerfilVC.swift
//  TestCoppel
//
//  Created by catalina lozano on 07/07/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class PerfilVC: UIViewController {
    
    @IBOutlet weak var tableView: UICollectionView!
    @IBOutlet weak var nombreLbl: UILabel!
    
    var serv = Servicio()
    
    var myResult: [Resultados]?{
        didSet{
            DispatchQueue.main.async { [self] in
                tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        serv.apicall3 { (x) in
            print(x.page)
            print(x.results)
            self.myResult = x.results
        }
        
    }
}
extension PerfilVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myResult?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = myResult?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PerfilDetailViewCell
        let x = movie?.vote_average
        
        cell.titulo.text = movie?.title
        cell.sinopsis.text = movie?.overview
        cell.fecha.text = movie?.release_date
        cell.imagen.contentMode = .scaleAspectFit
        
        if x != nil {
            cell.ranking.text = String(describing:x!)
            if (x! >= 7.9) {
                cell.imageStar.isHidden = false
            }
        }
        
        
        let defaultLink = "https://image.tmdb.org/t/p/w500/"
        let completeLink = defaultLink + myResult![indexPath.row].poster_path!
        cell.imagen.downloadedFrom(link: completeLink)
        return cell
        
        
        
    }
    
}

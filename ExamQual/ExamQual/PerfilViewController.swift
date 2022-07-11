//
//  PerfilViewController.swift
//  ExamQual
//
//  Created by catalina lozano on 09/07/22.
//

import UIKit

class PerfilViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UICollectionView!
    
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
extension PerfilViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myResult?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = myResult?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PerfilDetailCollectionViewCell
        let x = movie?.vote_average
        
        cell.tituloLbl.text = movie?.title
        cell.sinopsis.text = movie?.overview
        cell.fechaLbl.text = movie?.release_date
        cell.imagenImg.contentMode = .scaleAspectFit
        
        if x != nil {
            cell.rankingLbl.text = String(describing:x!)
            if (x! >= 7.9) {
                cell.imageStarImg.isHidden = false
            }
        }
        
        let defaultLink = "https://image.tmdb.org/t/p/w500/"
        let completeLink = defaultLink + myResult![indexPath.row].poster_path!
        cell.imagenImg.downloadedFrom(link: completeLink)
        return cell
    }
}

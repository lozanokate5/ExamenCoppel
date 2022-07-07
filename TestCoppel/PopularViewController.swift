//
//  PopularViewController.swift
//  TestCoppel
//
//  Created by catalina lozano on 07/07/22.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit){
        contentMode = mode
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data)
            else {return}
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit){
        guard let url = URL(string: link) else {return}
        downloadedFrom(url: url, contentMode: mode)
    }
}

class PopularViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let urlString = "https://image.tmdb.org/t/p/w500/"
    
    var serv = Servicio()
    
    var myResult: [Results]?{
        didSet{
            DispatchQueue.main.async { [self] in
                tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serv.apicall2 { (x) in
            print(x.page)
            print(x.results)
            self.myResult = x.results
        }
        
    }
}
extension PopularViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PopularViewCell
        let movie = myResult?[indexPath.row]
        
        let x = movie?.vote_average
        cell.titleLbl.text = movie?.original_title
        cell.fechaLbl.text = movie?.release_date
        cell.descLbl.text = movie?.overview
    
        if x != nil {
            cell.ratingLbl.text = String(describing:x!)
            if (x! >= 7.5) {
                cell.estrella.isHidden = false
            }
        }
        
        cell.posterImg.contentMode = .scaleAspectFill
        let defaultLink = "https://image.tmdb.org/t/p/w500/"
        let completeLink = defaultLink + myResult![indexPath.row].poster_path!
        cell.posterImg.downloadedFrom(link: completeLink)
      
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailPopularVC") as? DetailPopularVC{
            let movie = myResult?[indexPath.row]
            
            vc.x = myResult?[indexPath.row].original_title! ?? "vacio"
            vc.cont = myResult?[indexPath.row].vote_count ?? 0
            vc.resum = (myResult?[indexPath.row].overview)!
            vc.fech = myResult?[indexPath.row].release_date! ?? "vacio"
            vc.lang = myResult?[indexPath.row].original_language ?? "vacio"
           
          /*  let x = movie?.poster_path
            guard let poster = myResult?[indexPath.row].poster_path else {return}
            vc .imagen = UIImage(named: poster)!*/

          //  vc.imagen = UIImage(named: (myResult?[indexPath.row].poster_path!)!)!
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

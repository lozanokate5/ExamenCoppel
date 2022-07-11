//
//  Servicio.swift
//  ExamQual
//
//  Created by catalina lozano on 09/07/22.
//

import Foundation

public class Servicio {
    
    func apicall3(completion: @escaping(Top)->Void){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=5dbe846269400ce3f3ec83e78d445768&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            do{
                let json = try JSONDecoder().decode(Top.self, from: data!)
                //print(json)
                completion(json)
            }catch{}
        }
        task.resume()
    }
    
    
    func apicall2(completion: @escaping(Movie)->Void){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=5dbe846269400ce3f3ec83e78d445768&language=en-US") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            do{
                let json = try JSONDecoder().decode(Movie.self, from: data!)
                //print(json)
                completion(json)
            }catch{}
        }
        task.resume()
    }

    func apicall(){
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=5dbe846269400ce3f3ec83e78d445768&language=en-US") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            do{
                let json = try JSONDecoder().decode(Movie.self, from: data!)
                print(json)
            }catch{}
        }
        task.resume()
    }
}

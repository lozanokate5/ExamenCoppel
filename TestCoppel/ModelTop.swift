//
//  ModelTop.swift
//  TestCoppel
//
//  Created by catalina lozano on 07/07/22.
//

import Foundation

struct Top: Codable{
    let page: Int?
    let results:[Resultados]?
}

struct Resultados: Codable {
    let poster_path : String?
    let title : String?
    let overview : String?
    let release_date : String?
    let vote_average: Double?
}
/*
 struct Movie: Codable {
     let page: Int?
     let results:[Results]?
 }

 struct Results : Codable {
     let original_language: String
     let original_title : String?
     let overview : String?
     let release_date : String?
     let poster_path : String?
     let vote_average : Float?
     let popularity: Float?
     let vote_count: Int?
 }
 */

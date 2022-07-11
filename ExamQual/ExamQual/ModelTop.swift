//
//  ModelTop.swift
//  ExamQual
//
//  Created by catalina lozano on 09/07/22.
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

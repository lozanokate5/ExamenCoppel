//
//  Model.swift
//  ExamQual
//
//  Created by catalina lozano on 09/07/22.
//

import Foundation

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


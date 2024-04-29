//
//  LocationModel.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 29/4/24.
//

import Foundation

struct RespuestaApiLocation: Codable {
    let info: Info
    let results: [Locations]
}

struct Locations: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}

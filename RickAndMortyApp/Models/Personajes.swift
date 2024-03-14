//
//  Personajes.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 14/3/24.
//

import Foundation

struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: String
    let origin: Origin
    let location: Location
    let image: URL
    let episode: [String]
    let url: URL
    let created: String
}

struct Origin: Decodable {
    let name: String
    let url: URL
}

struct Location: Decodable {
    let name: String
    let url: URL
}

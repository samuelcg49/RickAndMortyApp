//
//  EpisodioModel.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 18/3/24.
//

import Foundation

struct Episodio: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}

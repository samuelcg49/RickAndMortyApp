//
//  ResponseModel.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 15/3/24.
//

import Foundation

struct RespuestaApiPersonajes: Codable {
    let info: Info
    let results: [Character]
}

struct RespuestaApiEpisodios: Codable {
    let info: Info
    let results: [Episodio]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: URL?
    let prev: URL?
}

//
//  ResponseModel.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 15/3/24.
//

import Foundation

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: URL?
    let prev: URL?
}

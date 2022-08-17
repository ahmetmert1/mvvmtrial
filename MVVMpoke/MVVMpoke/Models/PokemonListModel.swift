//
//  ListModel.swift
//  MVVMpoke
//
//  Created by Ahmet Mert ÖZ on 16.08.2022.
//

import Foundation

struct Pokemon : Codable {
    var next : String
    var results : [PokemonEntry]
}

struct PokemonEntry : Codable, Identifiable {
    let id = UUID()
    var name : String
    var url : String
}

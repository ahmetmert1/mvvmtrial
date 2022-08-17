//
//  PokemonListViewModel.swift
//  MVVMpoke
//
//  Created by Ahmet Mert ÖZ on 16.08.2022.
//

import Foundation
import UIKit


protocol PokemonListViewModelProtocol {
    
    var pokemons : [PokemonEntry] {get set}
    
    func fetchPokemons()
    
    
}

class PokemonListViewModel : ObservableObject {
    
    @Published var pokemons : [PokemonEntry] = []
    
    private let dataListManager : DataListManagerProtocol
    
    init(dataManager : DataListManagerProtocol = DataListManager.shared){
        self.dataListManager = dataManager
        
        
    }
}

extension PokemonListViewModel : PokemonListViewModelProtocol {
   
    func fetchPokemons() {
       
        dataListManager.fetchPokemonList()
        pokemons = dataListManager.pokemons
        
        
        
        
    }
    
    
    
    
}

//
//  PokemonListView.swift
//  MVVMpoke
//
//  Created by Ahmet Mert ÖZ on 16.08.2022.
//

import SwiftUI

struct PokemonListView: View {
    
    @StateObject var viewModel = PokemonListViewModel()
    
    var body: some View {
        

        Text("Umarım olur")
            .onAppear(){
                print("istek yapıldı")
                viewModel.fetchPokemons()
                print("Devamı")
                print(viewModel.pokemons)
                
                
            }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}

//
//  DataManager.swift
//  MVVMpoke
//
//  Created by Ahmet Mert ÖZ on 16.08.2022.
//

import Foundation

protocol DataListManagerProtocol {
    
    var pokemons : [PokemonEntry] {get set}
    func fetchPokemonList()
    
}


class DataListManager : ObservableObject {
    
    static let shared : DataListManagerProtocol = DataListManager()
    @Published  var pokemonsManager : [PokemonEntry] = []
    @Published  var pokemons : [PokemonEntry] = []
    private var offset = 0
    private init (){
        
        
        
    }
    
}

extension DataListManager : DataListManagerProtocol {
    
    
    func fetchPokemonList() {
        
        print("Data Manager içi veri cekme")
        
        let url = "https://pokeapi.co/api/v2/pokemon?offset=\(offset)&limit=20"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!){ data,response,err in
            
            if (err != nil){
                print(err?.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                
                do{
                    let jsonData = try JSONDecoder().decode(Pokemon.self, from: data!)
                    
                    if let httpResponse = response as? HTTPURLResponse {
                        print("Manager içi status code : \(httpResponse.statusCode)")
                    }
                    
                    let oldData = self.pokemonsManager
                    
                    print("Manager içi old data : \(oldData)")
                    print(jsonData.results)
                    
                    
                    self.pokemonsManager = oldData + jsonData.results
                    self.pokemons = oldData + jsonData.results
                    
                    self.offset += 20
                    print("Manager içi offset altı : ")
                    print(self.pokemonsManager)
                    print(self.offset)
                    
                    
                    
                }catch{
                    print("Error")
                    print(error.localizedDescription)
                }
            }
        }.resume()
       // return await pokemonsManager
    }
}


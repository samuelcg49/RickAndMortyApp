//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 14/3/24.
//

import SwiftUI

struct PersonajesView: View {
    
        @StateObject var viewModel = CharactersViewModel()
           
    
    var body: some View {
        NavigationView {
            List(viewModel.listaDePersonajes, id: \.id){ personaje in
                NavigationLink(destination: DetalleView(personaje: personaje)){
                    HStack{
                        AsyncImage(url: URL(string: personaje.image)){ image in
                            image.resizable().aspectRatio(contentMode: .fill)
                        }placeholder: {
                            ProgressView()
                        }.frame(width: 100, height: 100).cornerRadius(10)

                        VStack(alignment: .leading) {
                            Text(personaje.name).font(.title3)
                            if personaje.status == "Alive"{
                                Text(personaje.status).foregroundColor(.green)
                            }else if personaje.status == "Dead"{
                                Text(personaje.status).foregroundColor(.red)
                            }else{
                                Text(personaje.status).foregroundColor(.gray)
                            }
                            
                            
                        }
                            
                    }
                }
                        
            }.navigationTitle("Personajes")
        }
    }
}

#Preview {
    PersonajesView()
}

//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 14/3/24.
//

import SwiftUI

struct PersonajesView: View {
    
    @StateObject var viewModel = CharactersViewModel()
    @State var currentPage = 1
    
    var body: some View {
        NavigationView {
            List(viewModel.listaDePersonajes, id: \.id){ personaje in
                NavigationLink(destination: DetallePersonajeView(personaje: personaje)){
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
                        
                    }.onAppear {
                        if self.viewModel.isLastPersonaje(personaje) {
                            print("último personaje")
                            viewModel.getMorePersonajes(nextPage: currentPage + 1, numeroPersonaje: nil)
                            currentPage += 1
                            print("pagina actual \(currentPage)")
                        }
                    }
                }
                
            }.background(.white)
            .scrollContentBackground(.hidden)
            .navigationTitle("Personajes")
        }
    }
}

#Preview {
    PersonajesView()
}

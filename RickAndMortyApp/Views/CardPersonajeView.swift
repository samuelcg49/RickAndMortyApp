//
//  CardPersonajeView.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 1/5/24.
//

import SwiftUI

struct CardPersonajeView: View {
    @StateObject var viewModel: CharactersViewModel
    @State var indicePersonaje: String
    
    init(urlPersonaje: String) {
        self._viewModel = StateObject(wrappedValue: CharactersViewModel(urlPersonaje: urlPersonaje))
        self._indicePersonaje = State(initialValue: urlPersonaje)
    }
    
    var body: some View {
      
        VStack {
            AsyncImage(url: URL(string: viewModel.personaje.image)){ image in
                image.resizable().frame(maxWidth: 130, maxHeight: 130)
            } placeholder: {
                ProgressView()
            }.padding(.bottom, 15)
            Text(viewModel.personaje.name)
                .foregroundColor(.black)
            
        }.padding().border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/).background(Color.gray.opacity(0.30))
        
    }
}

#Preview {
    CardPersonajeView(urlPersonaje: "https://rickandmortyapi.com/api/character/1")
}

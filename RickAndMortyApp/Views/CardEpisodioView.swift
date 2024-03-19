//
//  CardEpisodioView.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 18/3/24.
//

import SwiftUI

struct CardEpisodioView: View {
    
    @StateObject var viewModel: EpisodioViewModel
    @State var indiceEpisodio: String
    
    init(urlEpisodio: String) {
        self._viewModel = StateObject(wrappedValue: EpisodioViewModel(url: urlEpisodio))
        self._indiceEpisodio = State(initialValue: urlEpisodio)
    }
    
    
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .frame(width: 200, height: 100).border(Color.black, width: 2)
            .overlay(
                Text(viewModel.infoEpisodio.name)
                    .foregroundColor(.black)
                    
            )
    }
    
    
}


#Preview {
    CardEpisodioView(urlEpisodio: "https://rickandmortyapi.com/api/episode/1")
}

//Rectangle().frame(width: 250, height: 150).cornerRadius(10).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).overlay(Text(indiceEpisodio))

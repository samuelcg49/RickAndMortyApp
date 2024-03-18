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
    
    init(indiceEpisodio: String) {
        self._viewModel = StateObject(wrappedValue: EpisodioViewModel(url: indiceEpisodio))
        self._indiceEpisodio = State(initialValue: indiceEpisodio)
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
    CardEpisodioView(indiceEpisodio: "https://rickandmortyapi.com/api/episode/1")
}

//Rectangle().frame(width: 250, height: 150).cornerRadius(10).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).overlay(Text(indiceEpisodio))

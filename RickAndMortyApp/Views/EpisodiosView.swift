//
//  EpisodiosView.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 22/3/24.
//

import SwiftUI

struct EpisodiosView: View {
    
    @StateObject var viewModel = EpisodiosViewModel()
    @State var currentPage = 1
    
    var body: some View {
        NavigationView {
            List(viewModel.listaDeEpisodios, id: \.id){ episodio in
                Text(episodio.name)
                    .onAppear {
                        if self.viewModel.isLastEpisodio(episodio) {
                            print("último episodio")
                            viewModel.getMoreEpisodios(nextPage: currentPage + 1)
                            currentPage += 1
                            print("pagina actual \(currentPage)")
                        }
                    }
            }.navigationTitle("Episodios")
        }
    }
}


#Preview {
    EpisodiosView()
}

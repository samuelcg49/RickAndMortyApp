//
//  EpisodiosView.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 22/3/24.
//

import SwiftUI

struct EpisodiosView: View {
    
    @StateObject var viewModel = EpisodioViewModel(url: "")
    @State var currentPage = 1
    
    var body: some View {
        NavigationView {
            List(viewModel.listaDeEpisodios, id: \.id){ episodio in
                VStack(alignment: .leading){
                    Text(episodio.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                        
                    HStack{
                        Text("Episodio: \(episodio.episode)")
                        Spacer()
                        Text(episodio.air_date)
                    }
                    
                }
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

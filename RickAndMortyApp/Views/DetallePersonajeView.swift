//
//  DetalleView.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 16/3/24.
//

import SwiftUI

struct DetallePersonajeView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel: CharactersViewModel
    @State var indicePersonaje: String
    
    init(urlPersonaje: String) {
        self._viewModel = StateObject(wrappedValue: CharactersViewModel(urlPersonaje: urlPersonaje))
        self._indicePersonaje = State(initialValue: urlPersonaje)
    }
    
    var body: some View {
        
        ZStack(alignment: .top){
            
            ScrollView{
                
                AsyncImage(url: URL(string: viewModel.personaje.image)){ image in
                    image.resizable().aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                
                VStack{
                    Text(viewModel.personaje.name).font(.title).fontWeight(.bold)
                    if viewModel.personaje.status == "Alive"{
                        Text(viewModel.personaje.status).foregroundColor(.green)
                    }else if viewModel.personaje.status == "Dead"{
                        Text(viewModel.personaje.status).foregroundColor(.red)
                    }else{
                        Text(viewModel.personaje.status).foregroundColor(.gray)
                    }
                    HStack{
                        VStack(alignment: .leading){
                            Text("Género: \(viewModel.personaje.gender)")
                        }.padding(.bottom)
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Raza: \(viewModel.personaje.species)")
                            Text("Status: \(viewModel.personaje.status)")
                        }
                        
                    }.padding(20)
                    Text("Episodios").font(.title)
                    ScrollView(.horizontal){
                        HStack(spacing: 20) {
                            ForEach(0..<viewModel.personaje.episode.count, id: \.self) { index in
                                NavigationLink(destination: DetalleEpisodioView(urlEpisodio: viewModel.personaje.episode[index])){
                                    CardEpisodioView(urlEpisodio: viewModel.personaje.episode[index])
                                }
                                
                            }
                            
                        }
                    }.padding(20)
                    
                }.padding()
                    .padding(.top)
                    .background(Color.white)
                    .cornerRadius(30.0)
                    .offset(y: -30)
                
            }.edgesIgnoringSafeArea(.top)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: CustomBackButton(action: {presentationMode.wrappedValue.dismiss()}) )
        }
    }
    
    
}

#Preview {
    DetallePersonajeView(urlPersonaje: "https://rickandmortyapi.com/api/character/1")
}


//

struct CustomBackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "chevron.backward")
                .padding(.all, 12)
                .background(Color.white).foregroundColor(.black)
                .cornerRadius(8)
        })
    }
}

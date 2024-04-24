//
//  DetalleView.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 16/3/24.
//

import SwiftUI

struct DetallePersonajeView: View {
    let personaje: Character
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
            ZStack(alignment: .top){
                    
                    ScrollView{
                        
                        AsyncImage(url: URL(string: personaje.image)){ image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        VStack{
                            Text(personaje.name).font(.title).fontWeight(.bold)
                            if personaje.status == "Alive"{
                                Text(personaje.status).foregroundColor(.green)
                            }else if personaje.status == "Dead"{
                                Text(personaje.status).foregroundColor(.red)
                            }else{
                                Text(personaje.status).foregroundColor(.gray)
                            }
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Género: \(personaje.gender)")
                                }.padding(.bottom)
                                Spacer()
                                VStack(alignment: .leading){
                                    Text("Raza: \(personaje.species)")
                                    Text("Status: \(personaje.status)")
                                }
                                
                            }.padding(20)
                            Text("Episodios").font(.title)
                            ScrollView(.horizontal){
                                HStack(spacing: 20) {
                                    ForEach(0..<personaje.episode.count) { index in
                                        CardEpisodioView(urlEpisodio: personaje.episode[index])
                                        
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
    DetallePersonajeView(personaje: PersonajeMock.personaje)
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

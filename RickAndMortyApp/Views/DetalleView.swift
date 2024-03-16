//
//  DetalleView.swift
//  RickAndMortyApp
//
//  Created by Samuel Cíes Gracia on 16/3/24.
//

import SwiftUI

struct DetalleView: View {
    let personaje: Character
    
    var body: some View {
        VStack{
            ZStack(alignment: .top){
                
                VStack{
                    AsyncImage(url: URL(string: personaje.image)){ image in
                        image.resizable().aspectRatio(contentMode: .fit).edgesIgnoringSafeArea(.top)
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
                     
                    }.padding()
                        .padding(.top)
                        .background(Color.white)
                        .cornerRadius(30.0)
                        .offset(y: -30)
                    
                }
                
            }
        }.edgesIgnoringSafeArea(.top)
        Spacer()
    }
}

#Preview {
    DetalleView(personaje: PersonajeMock.personaje)
}

//ZStack(alignment: .top){
//
//    VStack {
//        AsyncImage(url: URL(string: personaje.image)){ image in
//            image.resizable().aspectRatio(contentMode: .fill).frame(height: 300)
//        } placeholder: {
//            ProgressView()
//        }
//        Spacer()
//    }
//
//    HStack{
//        Spacer()
//        ZStack{
//            Rectangle().frame(width: 40, height: 40).foregroundColor(.white).cornerRadius(10)
//            Image(systemName: "heart").font(.title2)
//        }
//    }.padding(.top, 60).padding(.trailing, 30)
//
//}.edgesIgnoringSafeArea(.all)

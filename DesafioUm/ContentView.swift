//
//  ContentView.swift
//  DesafioUm
//
//  Created by Eduardo Hoffmann on 11/05/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {

        NavigationStack {
            ZStack {
                Color.gray.opacity(0.3)
                    .ignoresSafeArea()
                VStack{
                    
                    Text("Escolha uma unidade de medida para converter:")
                        .font(.custom(
                            "AmericanTypewriter",
                            fixedSize: 20))
                        .multilineTextAlignment(.center)
                    Spacer()
                    VStack(alignment: .leading) {
                        NavigationLink(destination: Temperature()) {
                            Label("Temperatura", systemImage: "thermometer.low")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding(30)
                        }
                    }
                    .frame(width: 300, alignment: .leading)
                    .background(Color(.systemOrange))
                    .cornerRadius(20)
                    .shadow(color: Color(.secondaryLabel),
                            radius: 12,
                            x: 0,
                            y: 15
                    )
                    
                    Spacer()
                    VStack(alignment: .leading) {
                        NavigationLink(destination: Length()) {
                            Label("Comprimento", systemImage: "ruler")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .padding(30)
                        }
                        
                    }
                    .frame(width: 300, alignment: .leading)
                    .background(Color(.systemGreen))
                    .cornerRadius(20)
                    .shadow(color: Color(.secondaryLabel),
                            radius: 12,
                            x: 0,
                            y: 15
                    )
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        NavigationLink(destination: Tempo()) {
                            Label("Tempo", systemImage: "clock")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding(30)
                        }
                    }
                    .frame(width: 300, alignment: .leading)
                    .background(Color(.systemBlue))
                    .cornerRadius(20)
                    .shadow(color: Color(.secondaryLabel),
                            radius: 12,
                            x: 0,
                            y: 15
                    )
                    Spacer()
                    VStack(alignment: .leading) {
                        NavigationLink(destination: Volume()) {
                            Label("Volume", systemImage: "testtube.2")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding(30)
                            
                        }
                        .navigationTitle("Conversões")
                        .navigationBarHidden(false)
                        
                    }
                    
                    .frame(width: 300, alignment: .leading)
                    .background(Color(.systemYellow))
                    .cornerRadius(20)
                    .shadow(color: Color(.secondaryLabel),
                            radius: 12,
                            x: 0,
                            y: 15
                    )
                    Spacer()
                }
            }
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


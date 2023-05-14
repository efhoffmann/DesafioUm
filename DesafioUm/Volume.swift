//
//  Volume.swift
//  DesafioUm
//
//  Created by Eduardo Hoffmann on 13/05/23.
//

import SwiftUI

struct Volume: View {
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    enum Volume: String, Equatable, CaseIterable {
        case litros
        case decilitros
        case centilitros
        case mililitros
    }
           
    @State private var number: Double = 0
    @State private var unitInput = Volume.litros
    @State private var unitOutput = Volume.mililitros
                            
    var calculoEntrada: Double {
        let valor = Double(number) ?? 0
        var entrada = 0.0
        var saida = 0.0
        
        switch unitInput {
        case .mililitros:
            entrada = valor / 1000
        case .centilitros:
            entrada = valor / 100
        case .decilitros:
            entrada = valor / 10
        default:
            entrada = valor
        }
        
        switch unitOutput {
        case .mililitros:
            saida = entrada * 1000
        case .centilitros:
            saida = entrada * 100
        case .decilitros:
            saida = entrada * 10
        default:
            saida = entrada
        }
        
        return saida
        
    }
    
    var body: some View {
         
            NavigationView {
                Form {
      
                    Section(header: Text("Escolha um valor de entrada")) {
                        TextField("Valor", value: $number, format: .number)
                    }
                    
                    Picker("Eu tenho o volume em:", selection: $unitInput) {
                        ForEach(Volume.allCases, id: \.self) { item in
                            Text(item.rawValue)
                        }
                    }
                    
                    Picker("E quero transformar em:", selection: $unitOutput) {
                        ForEach(Volume.allCases, id: \.self) { item in
                            Text(item.rawValue)
                        }
                    }
                    
                    Section {
                        Text("\(number, format: .number) \(unitInput.rawValue) é igual a \(calculoEntrada.formatted()) \(unitOutput.rawValue)")
                        
                    } header: {
                        Text("Resultado")
                    }
                    
                }
                .scrollContentBackground(.hidden)
                .background(Color.yellow).opacity(0.7)
                .navigationTitle("Volume")
                .navigationBarTitleDisplayMode(.inline)
       
            }
       
    }
}

struct Volume_Previews: PreviewProvider {
    static var previews: some View {
        Volume()
    }
}

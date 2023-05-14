//
//  Length.swift
//  DesafioUm
//
//  Created by Eduardo Hoffmann on 13/05/23.
//

import SwiftUI

struct Length: View {
    
    enum Medida: String, Equatable, CaseIterable {
        case quilometros
        case hectometros
        case decametros
        case metros
        case decimetros
        case centimetros
        case milimetros
    }
    
    @State private var number: Double = 0.0
    @State private var unitInput: Medida = .metros
    @State private var unitOutput = Medida.quilometros
    
        var calculoEntrada: Double {
            let valor = Double(number) ?? 0
            var entrada = 0.0
            var saida = 0.0
            
            switch unitInput {
            case .milimetros:
                entrada = valor / 1000
            case .centimetros:
                entrada = valor / 100
            case .decimetros:
                entrada = valor / 10
            case .decametros:
                entrada = valor * 10
            case .hectometros:
                entrada = valor * 100
            case .quilometros:
                entrada = valor * 1000
            default:
                entrada = valor
           
            }
            
            switch unitOutput {
            case .milimetros:
                saida = entrada * 1000
            case .centimetros:
                saida = entrada * 100
            case .decimetros:
                saida = entrada * 10
            case .decametros:
                saida = entrada / 10
            case .hectometros:
                saida = entrada / 100
            case .quilometros:
                saida = entrada / 1000
            default:
                saida = entrada
            }
            return saida
        }
        
    
    
    var body: some View {
        
        NavigationView {
            
            Form {
                Section {
                    TextField("Valor", value: $number, format: .number)
                } header: {
                    Text("Escolha um valor de entrada")
                }
                
                Picker("Eu tenho a medida em:", selection: $unitInput) {
                    ForEach(Medida.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }
                
                Picker("E quero transformar em:", selection: $unitOutput) {
                    ForEach(Medida.allCases, id: \.self) { item in
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
            .background(Color.green).opacity(0.7)
            .navigationTitle("Comprimento")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
            
    
    }
}

struct Length_Previews: PreviewProvider {
    static var previews: some View {
        Length()
    }
}

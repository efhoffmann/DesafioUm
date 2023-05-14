//
//  Tempo.swift
//  DesafioUm
//
//  Created by Eduardo Hoffmann on 13/05/23.
//

import SwiftUI

struct Tempo: View {
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    enum Tempo: String, Equatable, CaseIterable {
        case nanosegundos, microssegundos, milissegundos, segundos, minutos, horas
    }
    
    @State private var number: Double = 0
    @State private var unitInput: Tempo = .minutos
    @State private var unitOutput = Tempo.horas
    
    var calculoEntrada: Double {
        let valor = Double(number) ?? 0
        var entrada = 0.0
        var saida = 0.0
        
        switch unitInput {
        case .milissegundos:
            entrada = valor / 60000
        case .segundos:
            entrada = valor / 60
        case .horas:
            entrada = valor * 60
        case .microssegundos:
            entrada = valor / 60000000
        case .nanosegundos:
            entrada = valor / 60000000000
        default:
            entrada = valor
        }
        
        switch unitOutput {
        case .milissegundos:
            saida = entrada * 60000
        case .segundos:
            saida = entrada * 60
        case .horas:
            saida = entrada / 60
        case .microssegundos:
            saida = entrada * 60000000
        case .nanosegundos:
            saida = entrada * 60000000000
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
                
                Picker("Eu tenho o tempo em:", selection: $unitInput) {
                    ForEach(Tempo.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }
                
                Picker("E quero transformar em:", selection: $unitOutput) {
                    ForEach(Tempo.allCases, id: \.self) { item in
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
            .background(Color.blue).opacity(0.7)
            .navigationTitle("Tempo")
            .navigationBarTitleDisplayMode(.inline)
   
        }
    
    }
}

struct Tempo_Previews: PreviewProvider {
    static var previews: some View {
        Tempo()
    }
}

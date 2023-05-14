//
//  Temperature.swift
//  DesafioUm
//
//  Created by Eduardo Hoffmann on 13/05/23.
//

import SwiftUI

struct Temperature: View {
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    enum Temperatura: String, Equatable, CaseIterable {
        case celcius
        case fahrenheit
        case kelvin
    }
           
    @State private var number: Double = 0.0
    @State private var unitInput = Temperatura.celcius
    @State private var unitOutput = Temperatura.fahrenheit
    
    let formatStyle = Measurement<UnitTemperature>.FormatStyle(
        width: .wide,
        usage: .general,
        numberFormatStyle: .number
    )

    
    
    var calculoEntrada: Double {
        let temp = Double(number) ?? 0
        var entrada = 0.0
        var saida = 0.0
        switch unitInput {
        case .celcius:
            entrada = temp + 273.15
        case .fahrenheit:
            entrada = (temp + 459.67) * 5 / 9
        default:
            entrada = temp
        }
        
        switch unitOutput {
        case .celcius:
            saida = entrada - 273.15
        case .fahrenheit:
            saida = 1.8 * (entrada - 273.15) + 32
        default:
            saida = entrada
        }
        
        return saida
    }
    
  /*  var calculoSaida: Measurement<UnitTemperature> {
        let output = calculoEntrada
        switch unitOutput {
        case .celcius:
            return output.converted(to: .celsius)
        case .fahrenheit:
            return output.converted(to: .fahrenheit)
        case .kelvin:
            return output.converted(to: .kelvin)
        }
    } */
                            
    var body: some View {
         
            NavigationView {
                Form {
      
                    Section(header: Text("Escolha um valor de entrada")) {
                        TextField("Valor", value: $number, format: .number)
                    }
                    
                    Picker("Eu tenho a temperatura em:", selection: $unitInput) {
                        ForEach(Temperatura.allCases, id: \.self) { item in
                            Text(item.rawValue)
                        }
                    }
                    
                    Picker("E quero transformar em:", selection: $unitOutput) {
                        ForEach(Temperatura.allCases, id: \.self) { item in
                            Text(item.rawValue)
                        }
                    }
                    
                    Section {
                        Text("\(number, format: .number)º \(unitInput.rawValue) é igual a \(calculoEntrada.formatted())º \(unitOutput.rawValue)")
                        
                    } header: {
                        Text("Resultado")
                    }
                    
                }
                .scrollContentBackground(.hidden)
                .background(Color.orange).opacity(0.7)
                .navigationTitle("Temperatura")
                .navigationBarTitleDisplayMode(.inline)
       
            }
       
    }
}

struct Temperature_Previews: PreviewProvider {
    static var previews: some View {
        Temperature()
    }
}

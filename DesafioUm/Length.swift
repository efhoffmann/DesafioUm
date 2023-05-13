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
    
    @State private var number: Double = 0
    @State private var unitInput: Medida = .metros
    @State private var unitOutput = Medida.quilometros
    
    var calculo: Double {
        var resultado: Double = 0.0
        
        if unitInput == Medida.metros && unitOutput == Medida.quilometros {
            resultado = number / 1000
        } else if unitInput == Medida.metros && unitOutput == Medida.centimetros {
            resultado = number * 100
        } else if unitInput == Medida.quilometros && unitOutput == Medida.metros {
            resultado = number * 1000
        } else if unitInput == Medida.quilometros && unitOutput == Medida.centimetros {
            resultado = number * 100000
        }
        
            return resultado
        }
        
        var calculoEntrada: Measurement<UnitLength> {
            switch unitInput {
            case .centimetros:
                return Measurement(value: number, unit: UnitLength.centimeters)
            case .quilometros:
                return Measurement(value: number, unit: UnitLength.kilometers)
            case .hectometros:
                return Measurement(value: number, unit: UnitLength.hectometers)
            case .decametros:
                return Measurement(value: number, unit: UnitLength.decameters)
            case .metros:
                return Measurement(value: number, unit: UnitLength.meters)
            case .decimetros:
                return Measurement(value: number, unit: UnitLength.decimeters)
            case .milimetros:
                return Measurement(value: number, unit: UnitLength.millimeters)
            }
        }
        
        var calculoSaida: Measurement<UnitLength> {
            let output = calculoEntrada
            switch unitOutput {
            case .centimetros:
                return output.converted(to: .centimeters)
            case .quilometros:
                return output.converted(to: .kilometers)
            case .hectometros:
                return output.converted(to: .hectometers)
            case .decametros:
                return output.converted(to: .decameters)
            case .metros:
                return output.converted(to: .meters)
            case .decimetros:
                return output.converted(to: .decimeters)
            case .milimetros:
                return output.converted(to: .millimeters)
            }
        }
        
    
    
    var body: some View {
        
        NavigationView {
            ZStack{
                Color.green
            Form {
                Section {
                    TextField("Valor", value: $number, format: .number)
                } header: {
                    Text("Escolha um valor de entrada")
                }
                
                Picker("Escolha medida origem", selection: $unitInput) {
                    ForEach(Medida.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }
                
                Picker("Escolha medida destino", selection: $unitOutput) {
                    ForEach(Medida.allCases, id: \.self) { item in
                        Text(item.rawValue)
                    }
                }
                
                Section {
                    Text("\(number, format: .number) \(unitInput.rawValue) é igual a \(calculo.formatted()) \(unitOutput.rawValue)")
                    
                } header: {
                    Text("Resultado")
                }
                
            }
            .navigationTitle("Conversões")
            
        }
        
            
    }
    }
}

struct Length_Previews: PreviewProvider {
    static var previews: some View {
        Length()
    }
}

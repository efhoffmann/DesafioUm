//
//  Temperature.swift
//  DesafioUm
//
//  Created by Eduardo Hoffmann on 13/05/23.
//

import SwiftUI

struct Temperature: View {
    var body: some View {
        
        ZStack {
            Color.orange.opacity(0.3)
            
            Label("Temperature", systemImage: "thermometer.low")
                .font(.largeTitle)
            
               
        }
        .ignoresSafeArea()
       
    }
}

struct Temperature_Previews: PreviewProvider {
    static var previews: some View {
        Temperature()
    }
}

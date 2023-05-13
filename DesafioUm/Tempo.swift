//
//  Tempo.swift
//  DesafioUm
//
//  Created by Eduardo Hoffmann on 13/05/23.
//

import SwiftUI

struct Tempo: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.3)
            
            Text("tempo")
            
               
        }
        .ignoresSafeArea()
    }
}

struct Tempo_Previews: PreviewProvider {
    static var previews: some View {
        Tempo()
    }
}

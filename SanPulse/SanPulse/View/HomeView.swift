//
//  ContentView.swift
//  SanPulse
//
//  Created by Modibo on 27/02/2026.
//

import SwiftUI

struct HomeView: View {
     var dateFormatter  = Date().formatted(.dateTime.weekday(.wide).day().month().year())
    
    var body: some View {
        VStack(alignment: .leading) {
           Text("Bonjour, Docteur 👋")
                .fontWeight(.bold)
            
            Text( "\(dateFormatter)")
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    HomeView()
}

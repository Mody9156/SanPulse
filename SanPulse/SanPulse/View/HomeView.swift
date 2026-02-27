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
                .font(.title)

            Text( "\(dateFormatter)")
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            HStack {
                CustomRectangle(customColor: .green)
                CustomRectangle(customColor: .green)
            }
            
            HStack {
                CustomRectangle(customColor: .green)
                CustomRectangle(customColor: .green)
            }
            
            Spacer()
            
        }
        .padding()
    }
}

struct CustomRectangle: View {
    var customColor : Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundStyle(customColor)
            .frame(width: 150,height: 150)
    }
}


#Preview {
    HomeView()
}

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
        ScrollView {
            VStack(alignment: .leading) {
                Text("Bonjour, Docteur 👋")
                    .fontWeight(.bold)
                    .font(.title)
                
                Text( "\(dateFormatter)")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                
                HStack {
                    CustomRectangle(customColor: .green, customSystemName: "calendar")
                    CustomRectangle(customColor: .blue, customSystemName: "person.2")
                }
                
                HStack {
                    CustomRectangle(customColor: .orange, customSystemName: "bell")
                    CustomRectangle(customColor: .purple, customSystemName: "arrow.up")
                }
                
                Spacer()
                
            }
            .padding()
        }
    }
}

struct CustomRectangle: View {
    var customColor : Color
    var customSystemName: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(customColor)
                .frame(width: 150,height: 150)
            
            VStack{
                Image(systemName: customSystemName)
                    .foregroundStyle(.white)
                    .padding()
                
                Text("\(2)")
                    .foregroundStyle(.white)
                    .padding()
                Text("e")
                    .foregroundStyle(.white)
                    .padding()
            }
        }
    }
}


#Preview {
    HomeView()
}

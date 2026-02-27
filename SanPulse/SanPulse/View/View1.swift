import SwiftUI

struct View1: View {
    var body: some View {
        VStack {
            Image(systemName: "house.fill")
                .font(.largeTitle)
                .foregroundStyle(.blue)
            Text("Accueil")
                .font(.title2)
                .bold()
            Text("Bienvenue dans la première vue.")
                .font(.body)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

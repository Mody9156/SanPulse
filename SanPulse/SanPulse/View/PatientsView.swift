import SwiftUI

struct PatientsView: View {
    var body: some View {
        VStack {
            Image(systemName: "star.fill")
                .font(.largeTitle)
                .foregroundStyle(.yellow)
            Text("Favoris")
                .font(.title2)
                .bold()
            Text("Votre liste de favoris apparaît ici.")
                .font(.body)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

import SwiftUI

struct NotesView: View {
    var body: some View {
        VStack {
            Image(systemName: "gear")
                .font(.largeTitle)
                .foregroundStyle(.gray)
            Text("Réglages")
                .font(.title2)
                .bold()
            Text("Modifiez vos paramètres ici.")
                .font(.body)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

import SwiftUI

struct AppointmentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // HEADER
            HStack {
                Text("Rendez-vous")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Button(action: {}) {
                    Label("Nouveau", systemImage: "plus")
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(Color(hex: "#39855E"))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
        }
    }
}

#Preview {
    AppointmentView()
}

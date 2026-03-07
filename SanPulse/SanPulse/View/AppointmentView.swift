import SwiftUI

struct AppointmentView: View {
    @State var activeNavigatio: Bool = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // HEADER
                    HStack {
                        Text("Rendez-vous")
                            .font(.title)
                            .bold()
                        
                        Spacer()
                        
                        Button(action: {
                            activeNavigatio.toggle()
                        }) {
                            Label("Nouveau", systemImage: "plus")
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .background(Color(hex: "#39855E"))
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                        }
                        .navigationDestination(isPresented: $activeNavigatio) {
                            AppointmentCreationView()
                        }
                    }
                }
                .padding()
            }
            .onAppear{
                
            }
        }
    }
}

#Preview {
    AppointmentView()
}

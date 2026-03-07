import SwiftUI

struct AppointmentView: View {
    @State var activeNavigatio: Bool = false
    var appointmentViewModel = AppointmentViewModel()
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
                    
                    ForEach(appointmentViewModel.appointments, id: \.self) { appointment in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(appointment.patientName ?? "k")
                                .font(.headline)
                            HStack {
                                Text(appointment.type ?? "m" )
                                    .font(.subheadline)
                                Spacer()
                                if let time = appointment.time {
                                    Text(time.formatted(date: .numeric, time: .shortened))
                                        .font(.caption)
                                }
                            }
                            Text("Durée: \(appointment.duration) min")
                                .font(.caption)
                            if let note = appointment.note, !note.isEmpty {
                                Text("Note: \(note)")
                                    .italic()
                                    .font(.caption2)
                            }
                        }
                        .padding(.vertical, 8)
                        Divider()
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    AppointmentView()
}

import SwiftUI
import CoreData

struct AppointmentView: View {
    @State var activeNavigation: Bool = false
    var appointmentViewModel = AppointmentViewModel()
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Appointment.time, ascending: true)]
    )
    private var appointment: FetchedResults< Appointment>
  
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
                            activeNavigation.toggle()
                        }) {
                            Label("Nouveau", systemImage: "plus")
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .background(Color(hex: "#39855E"))
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                        }
                        .navigationDestination(isPresented: $activeNavigation) {
                            AppointmentCreationView()
                        }
                    }
                    
                    ForEach(appointment) { appointment in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(appointment.patientName ?? "")
                                .font(.headline)
                            HStack {
                                Text(appointment.type ?? "")
                                    .font(.subheadline)
                                Spacer()
                                if let time = appointment.time {
                                    Text(time, style: .time)
                                        .font(.caption)
                                } else {
                                    Text("")
                                        .font(.caption)
                                }
                            }
                            Text("Durée: \(appointment.duration) min")
                                .font(.caption)

                            if let note = appointment.note, !note.isEmpty {
                                Text(note)
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

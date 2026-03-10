import SwiftUI
import CoreData

struct AppointmentView: View {
    @State var activeNavigation: Bool = false
    var appointmentViewModel = AppointmentViewModel()
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Appointment.time, ascending: true)]
    )
    private var appointment: FetchedResults<Appointment>
    var statusColor: (_ statusName: String) -> Color {
        { statusName in
            switch statusName {
            case "Confirmé":
                return .green
            case "Planifié":
                return .blue
            case "Annulé":
                return .red
            case "Absent":
                return .orange
            case "Terminé":
                return .gray
            default:
                return .gray
            }
        }
    }
    
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
                                .background(Color("GreenBackground"))
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                        }
                        .navigationDestination(isPresented: $activeNavigation) {
                            AppointmentCreationView()
                        }
                    }
                    
                    ForEach(appointment, id: \.objectID) { appointment in
                        VStack(alignment: .leading, spacing: 10) {
                            HStack(alignment: .top) {
                                VStack(alignment: .leading, spacing: 4) {
                                    
                                    // Nom du patient
                                    Text(appointment.patientName ?? "")
                                        .font(.headline)
                                    
                                    // Type de rendez-vous
                                    Text(appointment.type ?? "")
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                    
                                    // Heure + durée
                                    HStack(spacing: 12) {
                                        
                                        if let time = appointment.time {
                                            Label {
                                                Text(time, style: .time)
                                            } icon: {
                                                Image(systemName: "clock")
                                            }
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                        }
                                        
                                        Text("\(appointment.duration) min")
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                    }
                                }
                                
                                Spacer()
                                
                                // Status badge
                                Text(appointment.status ?? "")
                                    .font(.caption)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(statusColor(appointment.status ?? "").opacity(0.15))
                                    .foregroundColor(statusColor(appointment.status ?? ""))
                                    .clipShape(Capsule())
                            }
                            // Notes
                            if let note = appointment.note, !note.isEmpty {
                                Divider()
                                
                                Text(note)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
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

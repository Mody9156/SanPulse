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
                                .background(Color("#39855E"))
                                .foregroundColor(.white)
                                .clipShape(Capsule())
                        }
                        .navigationDestination(isPresented: $activeNavigation) {
                            AppointmentCreationView()
                        }
                    }
                    
                    ForEach(appointment) { appointment in
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
                                    .background(Color.green.opacity(0.15))
                                    .foregroundColor(.green)
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
                        .padding()
                        .background(Color(.systemBackground))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(.systemGray5))
                        )
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

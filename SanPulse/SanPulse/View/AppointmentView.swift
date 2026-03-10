import SwiftUI
import CoreData

struct AppointmentView: View {
    
    @State private var activeNavigation = false
    @State private var searchable = ""
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Appointment.time, ascending: true)]
    )
    private var appointments: FetchedResults<Appointment>
    
    // MARK: Status Color
    func statusColor(_ status: String) -> Color {
        switch status {
        case "Confirmé": return .green
        case "Planifié": return .blue
        case "Annulé": return .red
        case "Absent": return .orange
        case "Terminé": return .gray
        default: return .gray
        }
    }
    
    // MARK: Filter Search
    var filteredAppointments: [Appointment] {
        if searchable.isEmpty {
            return Array(appointments)
        }
        
        return appointments.filter {
            ($0.patientName ?? "").localizedCaseInsensitiveContains(searchable) ||
            ($0.type ?? "").localizedCaseInsensitiveContains(searchable)
        }
    }
    
    // MARK: Group by date
    var groupedAppointments: [Date: [Appointment]] {
        Dictionary(grouping: filteredAppointments) { appointment in
            Calendar.current.startOfDay(for: appointment.time ?? Date())
        }
    }
    
    var sortedDates: [Date] {
        groupedAppointments.keys.sorted()
    }
    
    // MARK: Date format
    func formatDate(_ date: Date) -> String {
        let calendar = Calendar.current
        
        if calendar.isDateInToday(date) {
            return "Aujourd'hui"
        } else if calendar.isDateInTomorrow(date) {
            return "Demain"
        }
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        formatter.dateStyle = .full
        
        return formatter.string(from: date)
    }
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 24) {
                    
                    // HEADER
                    HStack {
                        Text("Rendez-vous")
                            .font(.largeTitle)
                            .bold()
                        
                        Spacer()
                        
                        Button {
                            activeNavigation.toggle()
                        } label: {
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
                    
                    // LISTE
                    ForEach(sortedDates, id: \.self) { date in
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            // Section Header
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundStyle(.green)
                                
                                Text(formatDate(date))
                                    .font(.headline)
                                
                                Spacer()
                                
                                Text("\(groupedAppointments[date]?.count ?? 0)")
                                    .font(.caption)
                                    .padding(6)
                                    .background(.gray.opacity(0.2))
                                    .clipShape(Circle())
                            }
                            
                            // Appointments
                            ForEach(groupedAppointments[date] ?? [], id: \.objectID) { appointment in
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    HStack(alignment: .top) {
                                        
                                        VStack(alignment: .leading, spacing: 6) {
                                            
                                            Text(appointment.patientName ?? "")
                                                .font(.headline)
                                            
                                            Text(appointment.type ?? "")
                                                .font(.subheadline)
                                                .foregroundStyle(AppointmentTypeStyle(type: appointment.type).color)
                                            
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
                                        
                                        // STATUS
                                        Text(appointment.status ?? "")
                                            .font(.caption)
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 4)
                                            .background(statusColor(appointment.status ?? "").opacity(0.15))
                                            .foregroundColor(statusColor(appointment.status ?? ""))
                                            .clipShape(Capsule())
                                    }
                                    
                                    if let note = appointment.note, !note.isEmpty {
                                        Divider()
                                        
                                        Text(note)
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                    }
                                }
                                .padding()
                                .background(.background)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(color: .black.opacity(0.05), radius: 4)
                                
                                if let last = groupedAppointments[date]?.last, appointment != last {
                                    Divider()
                                        .frame(height: 1)
                                        .background(Color.gray.opacity(0.2))
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            .searchable(text: $searchable, prompt: "Rechercher un patient ou un type")
        }
    }
}

#Preview {
    AppointmentView()
}

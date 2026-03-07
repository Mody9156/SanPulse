import SwiftUI

struct AppointmentCreationView: View {
    @State private var patientName: String = ""
    @State private var type: String = "Consultation"
    @State private var date = Date()
    @State private var duration: Int = 30
    @State private var note: String? = nil
    var newAppointmentViewModel = NewAppointmentViewModel()
    let types = ["Consultation", "Suivi", "Urgence", "Autre"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Nouveau rendez-vous")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.bottom, 8)
            
            Group {
                TextField("Nom du patient", text: $patientName)
                    .textFieldStyle(.roundedBorder)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) { Text($0) }
                }
                .pickerStyle(.menu)
                
                DatePicker("Date et heure", selection: $date, displayedComponents: [.date, .hourAndMinute])
                
                HStack {
                    Text("Durée")
                    Spacer()
                    Stepper(value: $duration, in: 10...180, step: 5) {
                        Text("\(duration) min")
                    }
                }
                
                TextField("Note (optionnel)", text: Binding(
                    get: { note ?? "" },
                    set: { note = $0.isEmpty ? nil : $0 }
                ))
                .textFieldStyle(.roundedBorder)
            }
            
            Button(
                action: {
                    // Logique d'ajout du rendez-vous à intégrer
                    try?   newAppointmentViewModel
                        .newAppoitment(
                            duration: duration,
                            patientName: patientName,
                            time: date,
                            type: type,
                            note: note ?? ""
                        )
                }) {
                    HStack {
                        Image(systemName: "calendar.badge.plus")
                        Text("Programmer le RDV")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex:"#39855E"))
                    .cornerRadius(12)
                }
                .padding(.top, 16)
            
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(18)
        .shadow(color: .black.opacity(0.15), radius: 8)
        .padding()
    }
}

#Preview("AppointmentCreationView") {
    AppointmentCreationView()
}

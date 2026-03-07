//
//  Appointment.swift
//  SanPulse
//
//  Created by Modibo on 02/03/2026.
//

import Foundation
// Used only for previews and sample data. Does NOT represent real Core Data appointments.
struct SampleAppointment: Identifiable {
    let id = UUID()
    let patientName: String
    let type: String
    let time: String
    let duration: Int
    let status: String
}

let todayAppointments: [SampleAppointment] = [
    
    SampleAppointment(
        patientName: "Jean Dupont",
        type: "Consultation",
        time: "09:00",
        duration: 30,
        status: "Confirmer"
    ),
    SampleAppointment(
        patientName: "Marie Martin",
        type: "Suivi",
        time: "11:00",
        duration: 45,
        status: "Confirmer"
    ),
    
]

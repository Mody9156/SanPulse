//
//  Appointment.swift
//  SanPulse
//
//  Created by Modibo on 02/03/2026.
//

import Foundation
struct Appointment: Identifiable {
    let id = UUID()
    let patientName: String
    let type: String
    let time: String
    let duration: Int
    let status: String
}

let todayAppointments: [Appointment] = [
    Appointment(patientName: "Jean Dupont", type: "Consultation", time: "09:00", duration: 30, status: "Confirmé"),
    Appointment(patientName: "Marie Martin", type: "Suivi", time: "11:00", duration: 45, status: "Planifié")
]

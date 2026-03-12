//
//  AppointmentProtocol.swift
//  SanPulse
//
//  Created by Modibo on 07/03/2026.
//

import Foundation
import SwiftUI
import CoreData

protocol AppointmentProtocol {
    func addAppointment(duration: Int,patientName: String,time: Date,type: String, note: String, status: String) throws -> Appointment
    func fetchAppointments() throws -> [Appointment]
    func delete(_ offsets: IndexSet) throws
}

//
//  AppointmentViewModel.swift
//  SanPulse
//
//  Created by Modibo on 07/03/2026.
//

import Foundation
import Observation

@Observable
class AppointmentViewModel {
    var fetchAppointment = FetchAppointment()
    var appointments: [Appointment] = []
    init() {}
    
    func showAppointment() throws {
        do{
            appointments = try fetchAppointment.fetchAppointments()
        }catch {
            print("bad fetch appointment")
        }
    }
    
    func deleteAppointement(_ offsets: IndexSet) {
        do{
            try fetchAppointment.delete(offsets)
        }catch {
            print("bad fetch appointment")
        }
    }
}

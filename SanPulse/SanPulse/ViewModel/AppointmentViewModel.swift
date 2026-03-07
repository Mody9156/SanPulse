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
    
    init() {}
    
    func showAppointment() throws {
        do{
            try fetchAppointment.fetchAppointments()
        }catch {
            print("bad fetch appointment")
        }
    }
}

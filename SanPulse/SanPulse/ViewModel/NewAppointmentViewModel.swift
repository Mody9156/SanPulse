//
//  FetchAppointmentViewModel.swift
//  SanPulse
//
//  Created by Modibo on 07/03/2026.
//

import Foundation
import Observation

@Observable
class NewAppointmentViewModel {
    var fetchAppointment = FetchAppointment()
    
    init() {}
    
    func newAppoitment(duration: Int,patientName: String,time: Date,type: String, status: String) throws {
        
        do {
            try fetchAppointment.addAppointment(duration: duration,
                                                patientName: patientName,
                                                time: time,
                                                type: type, status: status)
        }catch {
            print("error mec")
        }
    }
}

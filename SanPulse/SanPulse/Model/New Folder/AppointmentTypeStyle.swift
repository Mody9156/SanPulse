//
//  AppointmentTypeStyle.swift
//  SanPulse
//
//  Created by Modibo on 10/03/2026.
//

import Foundation
import SwiftUI

enum AppointmentTypeStyle: String {
    case consultation = "Consultation"
    case suivi = "Suivi"
    case urgence = "Urgence"
    case autre = "Autre"
    
    init(type: String?) {
        switch type {
        case AppointmentTypeStyle.consultation.rawValue:
            self = .consultation
        case AppointmentTypeStyle.suivi.rawValue:
            self = .suivi
        case AppointmentTypeStyle.urgence.rawValue:
            self = .urgence
        default:
            self = .autre
        }
    }
    
    var color: Color {
        switch self {
        case .consultation:
            return .green
        case .suivi:
            return .blue
        case .urgence:
            return .red
        case .autre:
            return .secondary
        }
    }
}

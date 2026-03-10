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
    case planifie = "Planifié"
    case autre
    
    init(type: String?) {
        switch type {
        case AppointmentTypeStyle.consultation.rawValue: self = .consultation
        case AppointmentTypeStyle.planifie.rawValue: self = .planifie
        default: self = .autre
        }
    }
    
    var color: Color {
        switch self {
        case .consultation: return .green
        case .planifie: return .blue
        case .autre: return .secondary
        }
    }
}

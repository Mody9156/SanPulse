//
//  StatItem.swift
//  SanPulse
//
//  Created by Modibo on 02/03/2026.
//

import Foundation
import SwiftUI

struct StatItem: Identifiable {
        let id = UUID()
        let icon: String
        let label: String
        let value: String
        let color: Color
    }
    
let stats: [StatItem] = [
       StatItem(icon: "calendar", label: "RDV aujourd'hui", value: "3", color: Color(hex: "#39855E")),
       StatItem(icon: "person.2", label: "Patients suivis", value: "42", color: .blue),
       StatItem(icon: "bell", label: "Rappels actifs", value: "5", color: .orange),
       StatItem(icon: "chart.line.uptrend.xyaxis", label: "Taux de suivi", value: "94%", color: .purple)
   ]
   

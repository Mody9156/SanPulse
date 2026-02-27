//
//  SanPulseApp.swift
//  SanPulse
//
//  Created by Modibo on 27/02/2026.
//

import SwiftUI

@main
struct SanPulseApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                Tab("Accueil",systemImage: "house"){
                    HomeView()
                }
                
                Tab("RDV",systemImage: "calendar"){
                    AppointmentView()
                }
                
                Tab("Patients",systemImage: "person.2"){
                    PatientsView()
                }
                
                Tab("Notes",systemImage: "note.text"){
                    NotesView()
                }
            }
        }
    }
}

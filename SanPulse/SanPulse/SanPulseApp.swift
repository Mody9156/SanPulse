//
//  SanPulseApp.swift
//  SanPulse
//
//  Created by Modibo on 27/02/2026.
//

import SwiftUI
import CoreData

@main
struct SanPulseApp: App {
    let persistenceController = CoreDataStack.share.PersistentContainer.viewContext
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
            .environment(\.managedObjectContext, persistenceController)
        }
    }
}


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
                
                Tab("Accueil",systemImage: "house"){
                    HomeView()
                }
                
                Tab("Accueil",systemImage: "house"){
                    HomeView()
                }
                
                Tab("Accueil",systemImage: "house"){
                    HomeView()
                }
            }
        }
    }
}

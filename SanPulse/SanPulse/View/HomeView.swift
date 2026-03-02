//
//  ContentView.swift
//  SanPulse
//
//  Created by Modibo on 27/02/2026.
//
//
//  HomeView.swift
//  SanPulse
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Mock Data
    
    struct StatItem: Identifiable {
        let id = UUID()
        let icon: String
        let label: String
        let value: String
        let color: Color
    }
    
    struct Appointment: Identifiable {
        let id = UUID()
        let patientName: String
        let type: String
        let time: String
        let duration: Int
        let status: String
    }
    
    let stats: [StatItem] = [
        StatItem(icon: "calendar", label: "RDV aujourd'hui", value: "3", color: Color(hex: "#39855E")),
        StatItem(icon: "person.2", label: "Patients suivis", value: "42", color: .blue),
        StatItem(icon: "bell", label: "Rappels actifs", value: "5", color: .orange),
        StatItem(icon: "chart.line.uptrend.xyaxis", label: "Taux de suivi", value: "94%", color: .purple)
    ]
    
    let todayAppointments: [Appointment] = [
        Appointment(patientName: "Jean Dupont", type: "Consultation", time: "09:00", duration: 30, status: "Confirmé"),
        Appointment(patientName: "Marie Martin", type: "Suivi", time: "11:00", duration: 45, status: "Planifié")
    ]
    
    var formattedDate: String {
        Date().formatted(.dateTime.weekday(.wide).day().month().year())
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                // MARK: - Header
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Bonjour, Docteur 👋")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(formattedDate)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                
                // MARK: - Stats Grid
                
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 16) {
                    
                    ForEach(stats) { stat in
                        StatCard(stat: stat)
                    }
                }
                
                // MARK: - Today's Appointments
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    HStack {
                        Text("Rendez-vous du jour")
                            .font(.headline)
                        
                        Spacer()
                        
                        Text("\(todayAppointments.count)")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Color.green.opacity(0.1))
                            .foregroundColor(Color(hex: "#39855E"))
                            .clipShape(Capsule())
                    }
                    
                    if todayAppointments.isEmpty {
                        EmptyAppointmentView()
                    } else {
                        ForEach(todayAppointments) { appointment in
                            AppointmentCard(appointment: appointment)
                        }
                    }
                }
                
                // MARK: - Quick Actions
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Actions rapides")
                        .font(.headline)
                    
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 12) {
                        
                        QuickActionButton(icon: "calendar", title: "Nouveau RDV")
                        QuickActionButton(icon: "person.badge.plus", title: "Nouveau patient")
                        QuickActionButton(icon: "note.text", title: "Note rapide")
                        QuickActionButton(icon: "bell.badge", title: "Nouveau rappel")
                    }
                }
            }
            .padding()
        }
    }
}

////////////////////////////////////////////////////////////
// MARK: - Components
////////////////////////////////////////////////////////////

struct StatCard: View {
    let stat: HomeView.StatItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: stat.icon)
                .foregroundColor(.white)
                .font(.title3)
            
            Text(stat.value)
                .font(.title)
                .bold()
                .foregroundColor(.white)
            
            Text(stat.label)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.9))
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 140)
        .background(stat.color)
        .cornerRadius(16)
    }
}

struct AppointmentCard: View {
    let appointment: HomeView.Appointment
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack {
                VStack(alignment: .leading) {
                    Text(appointment.patientName)
                        .fontWeight(.semibold)
                    
                    Text(appointment.type)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                
                Text(appointment.status)
                    .font(.caption)
                    .padding(6)
                    .background(Color.gray.opacity(0.15))
                    .clipShape(Capsule())
            }
            
            HStack(spacing: 16) {
                Label(appointment.time, systemImage: "clock")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                
                Text("\(appointment.duration) min")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 5)
    }
}

struct QuickActionButton: View {
    let icon: String
    let title: String
    
    var body: some View {
        Button(action: {}) {
            VStack(alignment: .leading, spacing: 8) {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(Color(hex: "#39855E"))
                
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 90)
            .background(Color(.systemBackground))
            .cornerRadius(14)
            .shadow(color: .black.opacity(0.05), radius: 5)
        }
    }
}

struct EmptyAppointmentView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "clock")
                .font(.largeTitle)
                .foregroundColor(.gray.opacity(0.5))
            
            Text("Aucun rendez-vous aujourd'hui")
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
    }
}

////////////////////////////////////////////////////////////
// MARK: - Hex Color Extension
////////////////////////////////////////////////////////////

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let r, g, b: UInt64
        (r, g, b) = ((int >> 16) & 255, (int >> 8) & 255, int & 255)
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255
        )
    }
}

#Preview {
    HomeView()
}

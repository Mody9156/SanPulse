//
//  ContentView.swift
//  SanPulse
//
//  Created by Modibo on 27/02/2026.
//

import SwiftUI

struct HomeView: View {
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

struct StatCard: View {
    let stat: StatItem
    
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
    let appointment: Appointment
    
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
                
//                Text(appointment.status)
//                    .font(.caption)
//                    .padding(6)
//                    .background(Color.gray.opacity(0.15))
//                    .clipShape(Capsule())
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
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray.opacity(0.3),lineWidth: 1)
                })
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

#Preview {
    HomeView()
}

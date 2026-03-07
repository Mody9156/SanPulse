//
//  FetchAppointment.swift
//  SanPulse
//
//  Created by Modibo on 06/03/2026.
//

import Foundation
import CoreData
import Observation
import SwiftUI

@Observable
class FetchAppointment {
    var context: NSManagedObjectContext

    init(
        context: NSManagedObjectContext = CoreDataStack.share.PersistentContainer.viewContext
    ) {
        self.context = context
    }

    // MARK: - Create
    @discardableResult
    func addAppointment(duration: Int,
                        patientName: String,
                        time: Date,
                        type: String
    ) throws -> Appointment {
        var created: Appointment!
        try context.performAndWait {
            let appointment = Appointment(context: context)
            appointment.patientName = patientName
            appointment.type = type
            appointment.time = time
            appointment.duration = Int64(duration)

            try context.save()
            created = appointment
        }
        return created
    }

    // MARK: - Fetch
    func fetchAppointments(predicate: NSPredicate? = nil,
                           sortDescriptors: [NSSortDescriptor] = [NSSortDescriptor(keyPath: \Appointment.time, ascending: true)],
                           fetchLimit: Int = 0) throws -> [Appointment] {
        let request: NSFetchRequest<Appointment> = Appointment.fetchRequest()
        request.predicate = predicate
        request.sortDescriptors = sortDescriptors
        if fetchLimit > 0 { request.fetchLimit = fetchLimit }
        var results: [Appointment] = []
        try context.performAndWait {
            results = try context.fetch(request)
        }
        return results
    }

    // MARK: - Delete
    func delete(_ appointment: Appointment) throws {
        try context.performAndWait {
            context.delete(appointment)
            try context.save()
        }
    }
}

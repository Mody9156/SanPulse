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
    var context : NSManagedObjectContext
    
    init(
        context: NSManagedObjectContext = CoreDataStack.share.PersistentContainer.viewContext
    ) {
        self.context = context
    }
    
    func addAppointement(duration:Int,
                         PatientName:String,
                         time:Date,
                         type:String) throws {
        
         context.performAndWait {
            let appointment = Appointment(context: context)
             
        }
    }
    
}

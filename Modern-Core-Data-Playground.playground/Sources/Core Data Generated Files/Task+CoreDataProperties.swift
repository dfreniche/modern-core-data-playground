//
//  Task+CoreDataProperties.swift
//  
//
//  Created by Diego Freniche Brito on 20/02/17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task");
    }

    @NSManaged public var desc: String?
    @NSManaged public var title: String?
    @NSManaged public var project: Project?

}

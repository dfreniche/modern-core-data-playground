//: Let's explore the Core Data Stack created when using an NSPersistentContainer
//: The Core Data Stack is at least one Context, the Persistent Store Coordinator and a Persistent Object Store

import CoreData

// hwContainer is a func located in this playground's common Sources folder, file HWContainer.swift

let container = hwContainer()   // init an NSPersistentContainer

//: CONTEXT: get the main thread attached context. This is a NSManagedObjectContext

let context = container.viewContext

//: MANAGED OBJECT MODEL (MOM)

let model = container.managedObjectModel

// let's print all the Entities we have defined inside that MOM

print("\nEntities inside MOM")
for e in model.entities {
    print("Entity name: " + e.name!)
}
//: PERSISTENT STORE COORDINATOR

let psc = container.persistentStoreCoordinator

//: PERSISTENT STORES
print("\n💾All Persistent Stores used:")
for ps in psc.persistentStores {
    print(ps.description)
}

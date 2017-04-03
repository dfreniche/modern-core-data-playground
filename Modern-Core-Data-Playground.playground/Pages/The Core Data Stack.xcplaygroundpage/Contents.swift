/*: Let's explore the Core Data Stack created using an NSPersistentContainer */


// hwContainer is a func located in this playground's common Sources folder, file HWContainer.swift

let container = hwContainer()   // init an NSPersistentContainer

//: CONTEXT: get the main thread attached context

let context = container.viewContext

//: MANAGED OBJECT MODEL (MOM)

let model = container.managedObjectModel

// let's print all the Entities we have defined
for e in model.entities {
    print("Entity name: " + e.name!)
}

//: PERSISTENT STORE COORDINATOR

let psc = container.persistentStoreCoordinator


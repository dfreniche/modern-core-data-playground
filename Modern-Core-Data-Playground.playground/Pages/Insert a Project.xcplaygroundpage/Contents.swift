import CoreData

let container = hwContainer()   // init an NSPersistentContainer

/*: 
 Core Data manages your data only if you create it inside a Context
 Inserting new instances inside a NSManagedObjectContext is really easy
*/

// get the main thread attached context
let context = container.viewContext

//: To insert an Object in the context, we just create it passing in an NSManagedObjectContext
let project1 = Project(context: context)

// set some properties
project1.name = "World domination"
project1.priority = 1

//: after inserting, we can ask the context for the number of objects pending to be saved (in a _dirty_ state), then call the `save` method to persist all changes in the context

do {
    // how many objects pending to be saved?
    let newObjectsCount = context.insertedObjects.count
    print("Preparing to save \(newObjectsCount)")
    
    // save
    try context.save()
    print("Saved")
    
} catch {
    fatalError("Unresolved error \(error)")
}

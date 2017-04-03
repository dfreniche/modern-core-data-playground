import CoreData

/*: NSPersistentContainer is really nice. Creates a Core Data Stack for us automagically. 
 But what if we need to configure that Core Data Stack? Can we create a Core Data Stack in Memory? */

//: For that, we first need to create a Persistent Store Description
let persistentStoreDescription: NSPersistentStoreDescription = NSPersistentStoreDescription()

//: Then, we configure the Persistent Store Description
persistentStoreDescription.type = NSInMemoryStoreType
persistentStoreDescription.shouldMigrateStoreAutomatically = true
persistentStoreDescription.shouldInferMappingModelAutomatically = true

/*: 
 And now we simply create our `NSPersistentContainer` and set the `persistentStoreDescriptions`
 `persistentStoreDescriptions` is an array of descriptions
 
 */

let container = NSPersistentContainer(name: "CoreDataModelHelper")
container.persistentStoreDescriptions = [persistentStoreDescription]

/* important: set the store descriptions __before__ loading the persistent stores
 This makes sense, as store descriptions are the configuration for the persistent stores
 */

container.loadPersistentStores(completionHandler: { (storeDescription, error) in
    print("Store URL: \(storeDescription.url)")
    if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
    }
})

//: Now we can check this in-memory context

// the viewContext has no changes
container.viewContext.hasChanges

// get the main thread attached context
let context = container.viewContext

// insert an Object in the context
let project1 = Project(context: context)

// set some properties
project1.name = "World domination"
project1.priority = 1

do {
    container.viewContext.hasChanges
    
    // how many objects pending to be saved?
    let newObjectsCount = context.insertedObjects.count
    print("Preparing to save \(newObjectsCount)")
    
    // save
    try context.save()
    print("Saved")
    
} catch {
    fatalError("Unresolved error \(error)")
}


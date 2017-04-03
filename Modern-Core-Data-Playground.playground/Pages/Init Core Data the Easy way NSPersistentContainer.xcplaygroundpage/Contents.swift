import CoreData

/*: # The Core Data Stack
 
 The Core Data Stack is how we refer to the neccessary components to make a basic Core Data App work. We need at least one NSManagedObjectContext, a NSPersistentStoreCoordinator and a NSManagedObjectModel. In the past, creating this stack was a little bit tedious and you needed to master all the nitty-gritty details. Now it's way simpler.
 
 */

/*: Let's init an NSPersistentContainer with the name `CoreDataModelHelper`. This will be the name of the generated SQLite database file and the name of the Managed Object Model it expects to load. See the global Resources folder in this Playground the file CoreDataModelHelper.momd? That file contains the "definitions" of our Core Data Entities. */

let container = NSPersistentContainer(name: "CoreDataModelHelper")

//: printing the container description gives us a lot of info

print(container.persistentStoreDescriptions.debugDescription)

print("Number of persistent stores loaded \(container.persistentStoreCoordinator.persistentStores.count)")

/*: we load the Persistent Store here */

container.loadPersistentStores(completionHandler: { (storeDescription, error) in
    if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
    }
})

//: now the persisten Store is loaded!

print("Number of persistent stores loaded \(container.persistentStoreCoordinator.persistentStores.count)")

//: we get access to an NSManagedObjectContext, which is where we insert / delete / work with our Objects

let context = container.viewContext

print("Has this context pending changes? \(context.hasChanges)")

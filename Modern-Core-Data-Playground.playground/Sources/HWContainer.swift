import CoreData

public func hwContainer() -> NSPersistentContainer {
    
    let container = NSPersistentContainer(name: "CoreDataModelHelper")
    
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
        print("Store URL: \(String(describing: storeDescription.url))")
        if let error = error as NSError? {
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
    })
    
    return container
}

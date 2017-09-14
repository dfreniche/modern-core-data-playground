import CoreData

//: Every single time we insert, delete, etc. something in a Core Data Context a Notification is sent

// we get a NSPersistentContainer
let container = hwContainer()
let context = container.viewContext

public class CoreDataNotificationObserver: NSObject {
    override init() {
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(receivedInsertNotification), name: NSNotification.Name.NSManagedObjectContextDidSave, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(receivedUpdateNotification), name: NSNotification.Name.NSManagedObjectContextObjectsDidChange, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc public func receivedInsertNotification() {
        print("👉 Insert notification received")
    }
    
    @objc public func receivedUpdateNotification() {
        print("👉 Update notification received")
    }
}


// let's insert one object: still no notifications
let project = insertEmptyProjectInContext(context: context)

// we create a Notification Observer: this registers itself in the init() method
let notificationObserver = CoreDataNotificationObserver()

do {
    print("Preparing to save")
    try context.save()  // here NSManagedObjectContextDidSave is emitted
    print("Saved")
} catch {
    fatalError("Unresolved error \(error)")
}

// let's update that project

project.name = "Changed!"

do {
    print("Preparing to save after update")
    try context.save()  // here NSManagedObjectContextDidSave is emitted
    print("Saved after update")
} catch {
    fatalError("Unresolved error \(error)")
}


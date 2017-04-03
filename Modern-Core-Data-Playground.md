https://cocoacasts.com/building-the-perfect-core-data-stack-with-nspersistentcontainer/


NSPersistentContainer

open var viewContext: NSManagedObjectContext { get }

    open var managedObjectModel: NSManagedObjectModel { get }

    open var persistentStoreCoordinator: NSPersistentStoreCoordinator { get }


    open func newBackgroundContext() -> NSManagedObjectContext

    open func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Swift.Void)



http://stackoverflow.com/a/40056499/225503


Code generation explained:

https://useyourloaf.com/blog/core-data-code-generation/
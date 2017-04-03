import CoreData

// fetches the first project in our Context
public func firstProject(context: NSManagedObjectContext) -> Project? {
    let fetchRequest: NSFetchRequest<Project> = Project.fetchRequest()
    
    // Set the batch size to a suitable number.
    fetchRequest.fetchBatchSize = 20
    
    // Edit the sort key as appropriate.
    let sortDescriptor = NSSortDescriptor(key: "name", ascending: false)
    
    fetchRequest.sortDescriptors = [sortDescriptor]
    
    do {
        let result = try context.fetch(fetchRequest)
        return result.first

    } catch {
        print("Error \(error.localizedDescription)")
    }
    return nil
}

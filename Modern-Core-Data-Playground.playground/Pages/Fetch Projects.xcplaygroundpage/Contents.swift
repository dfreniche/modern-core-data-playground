import CoreData

/*: Fetching data from Core Data. This is how we get our objects from Core Data. It hasn't to be a Database, but think of fetching like issuing a SQL SELECT statement to Core Data */

// we get a NSPersistentContainer
let container = hwContainer()
let context = container.viewContext

// insert some dummy test data
insertSomeProjectsInContext(context: context)

// fetch all projects
let fetchRequest: NSFetchRequest<Project> = Project.fetchRequest()

// Set the batch size to a suitable number.
fetchRequest.fetchBatchSize = 20

// Set a sort key so results get ordered
let sortDescriptor = NSSortDescriptor(key: "name", ascending: false)
fetchRequest.sortDescriptors = [sortDescriptor]

do {
    // run the fetch request
    let result: [Project] = try context.fetch(fetchRequest)
    print("Num records: \( result.count )")
    
    // print all projects
    for p in result {
        print("title " + p.name! + p.description)
    }
} catch {
    print("Error \(error.localizedDescription)")
}


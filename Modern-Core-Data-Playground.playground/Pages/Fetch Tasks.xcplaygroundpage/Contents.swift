import CoreData

let container = hwContainer()
let context = container.viewContext

insertSomeProjectsInContext(context: context)

// fetch all tasks

let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()

// Set the batch size to a suitable number.
fetchRequest.fetchBatchSize = 20

// Edit the sort key as appropriate.
let sortDescriptor = NSSortDescriptor(key: "title", ascending: false)

let fp = firstProject(context: context)

fp?.description

// fetchRequest.predicate = NSPredicate(format: "project == %@", fp!)
fetchRequest.predicate = NSPredicate(format: "title == 'Locate 007'", fp!)

fetchRequest.sortDescriptors = [sortDescriptor]

let runFetch = {
    do {
        let result = try context.fetch(fetchRequest)
        print("*** Found Num records: \( result.count )")
        
        for p in result {
            print("title " + p.title!)
        }
    } catch {
        print("Error \(error.localizedDescription)")
    }
}

runFetch()

fetchRequest.predicate = NSPredicate(format: "project.name == 'Evil project 1'", fp!)

runFetch()

//


fetchRequest.predicate = NSPredicate(format: "title CONTAINS[c] '007'")

runFetch()


fetchRequest.predicate = NSPredicate(format: "project = %@", fp!)

runFetch()




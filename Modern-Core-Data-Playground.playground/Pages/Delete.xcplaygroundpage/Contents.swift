import CoreData

/*: Let's see how we delete objects in Core Data */

let container = hwContainer()   // init an NSPersistentContainer

// get the main thread attached context
let context = container.viewContext

// we insert some dummy data. This func is inside Sources > InsertSomeProjects.swift
insertSomeProjectsInContext(context: context)

let numProjectsBeforeDelete = countAllProjects(context: context)

print("Projects before deleting \(numProjectsBeforeDelete)")

/*: Let's see how we can __delete__ all projects
 */

// This function, when called, deletes all projects from Core Data. It need a context

func deleteAllProjects(context: NSManagedObjectContext) {
    let fetchRequest: NSFetchRequest<Project> = Project.fetchRequest()
    
    do {
        let result = try context.fetch(fetchRequest)
        print("Num records to delete: \( result.count )")
        for e in result {
            context.delete(e)   // to delete an object, just call delete on the context
        }
    } catch {
        print("Something bad happened while deleting all projects")
        print("Here's the info I have \(error.localizedDescription)")
    }
}

deleteAllProjects(context: context)

print("Projects after deleting \(countAllProjects(context: context))")






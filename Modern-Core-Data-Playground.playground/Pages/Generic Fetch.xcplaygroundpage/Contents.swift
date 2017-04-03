import CoreData

/*: In our examples, Fetches depend on a concrete type. We're fetching projects, or fetching tasks. But code is almost the same. We can avoid that duplication just usign generics */

public class GenericFetch<T> {
    // this func returns a NSFetchRequest for the type we need
    // call it like:
    // GenericFetch<MyCoreDataClass>.fetchRequest()
    public class func fetchRequest() -> NSFetchRequest<NSFetchRequestResult> {
        return NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: T.self))
    }
    
    public class func execute(fetchRequest: NSFetchRequest<NSFetchRequestResult>, inContext context: NSManagedObjectContext) -> (result: [T], error: NSError?) {
        
        let result: [T]
        var err: NSError?
        do {
            err = nil
            result = try context.fetch(fetchRequest) as! [T]
        } catch {
            err = error as NSError?
            result = [T]()
        }
        return (result, err)
    }
}

//: Let's create a fetch request for Projects
let fetchRequest = GenericFetch<Project>.fetchRequest()
print(String(describing: fetchRequest.entityName)) // prints "Project"

//: Let's create a fetch request for Tasks
let tasksFetchRequest = GenericFetch<Task>.fetchRequest()
print(String(describing: tasksFetchRequest.entityName)) // prints "Task"

//: To test this, we start with our classic container
let container = hwContainer()
let context = container.viewContext

//: Let's insert a bunch of Projects

insertSomeProjectsInContext(context: context)

//: Let's fetch all the Projects

let result = GenericFetch<Project>.execute(fetchRequest: fetchRequest, inContext: context)

print("😉 Result:")
print(String(describing: result))
print("❤️ Num records: \( result.result.count )")
    
for p in result.result {
    print("👉 title " + p.name! + p.description)
}


import CoreData

let container = hwContainer()   // init an NSPersistentContainer

//: Insert a new Project and then some Tasks linked to that project

// get the main thread attached context
let context = container.viewContext

// insert an Object in the context
let project1 = Project(context: context)

// set some properties
project1.name = "Evil project 1"
project1.priority = 1

//: There's a 1--n relationship between Project and Task. So each task belongs to a project

let task1 = Task(context: context)
task1.title = "Locate 007"
task1.project = project1

let task2 = Task(context: context)
task2.title = "Prepare super-trap"
task2.project = project1

do {
    // how many objects pending to be saved?
    let newObjectsCount = context.insertedObjects.count
    print("Preparing to save \(newObjectsCount)")
    
    // save
    try context.save()
    
    print("Saved")
    
} catch {
    fatalError("Unresolved error \(error)")
}

// traverse 1-->n relationship, from Project to Task

let tasks: NSOrderedSet = project1.tasks!
for t in tasks {
    print("Task title: \(String(describing: (t as! Task).title))")
}


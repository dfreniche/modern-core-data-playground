import CoreData

public func insertOneProjectInContext(context: NSManagedObjectContext) {
    // insert a Project in the context
    let project1 = Project(context: context)

    // set some properties
    project1.name = "Evil project 1"
    project1.priority = 1

    // create a couple Tasks
    
    let task1 = Task(context: context)
    task1.title = "Locate 007"
    task1.project = project1    // this task belongs to project1

    let task2 = Task(context: context)
    task2.title = "Prepare super-trap"
    task2.project = project1    // this task belongs to project1

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
}

public func insertSomeProjectsInContext(context: NSManagedObjectContext) {
    
    for i in 0..<10 {
        // insert a Project in the context
        let project1 = Project(context: context)
        
        // set some properties
        project1.name = "Evil project \(i)"
        project1.priority = 1
        
        // create some Tasks
        
        let randomNum:UInt32 = arc4random_uniform(10)
        
        for j in 0..<randomNum {
            let task1 = Task(context: context)
            task1.title = "To-do evil task # \(j)"
            task1.project = project1    // this task belongs to project - i
        }
    }
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
}


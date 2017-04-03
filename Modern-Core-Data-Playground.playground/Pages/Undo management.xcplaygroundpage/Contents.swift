import CoreData

// we get a NSPersistentContainer
let container = hwContainer()
let context = container.viewContext

// insert some dummy test data
let project1 = Project(context: context)

// set some properties
project1.name = "World domination"
project1.priority = 1

do {
    let newObjectsCount = context.insertedObjects.count
    print("Preparing to save \(newObjectsCount)")
    
    // we save that project
    try context.save()
    
    print("Saved")
} catch {
    fatalError("Unresolved error \(error)")
}

print(project1.name)    // prints "World Domination"

/*: We need an UndoManager in our Context */
context.undoManager = UndoManager()
context.undoManager?.beginUndoGrouping()

// we change the name of that project
project1.name = "Something strange"

context.undoManager?.endUndoGrouping()

print(project1.name)    // prints "Something strange"

// Now we undo that change

context.undo()

print(project1.name)    // prints "World Domination"


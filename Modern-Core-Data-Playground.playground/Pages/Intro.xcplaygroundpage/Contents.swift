/*:
 
 # Modern Core Data Playground
 
 This Playground will help you quickly test and learn core concepts about Core Data in a simple way
 
 ## The model used in this example
 
 - you can create __Projects__
 - a Project has _name_, _priority_, _startDate_ and several _tasks_
 - you can create and add _tasks_ to a _project_
 - a __Task__ belongs to just one Project (it's a 1-n relationship, 1 Project can have n Tasks)
 - a Task has _desc_ and _title_
 
 ```
+-----------------+               +----------------+
|    Project      |               |     Task       |
|-----------------| 1           n |----------------|
| name: String    |---------------|title: String   |
| priority: Int   |               |desc: String    |
| startDate: Date |               |                |
+-----------------+               +----------------+
 
 ```
 
 */

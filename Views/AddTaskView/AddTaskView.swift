// SWIFTUI File

struct AddTaskView : some View{
    
    @ObservedObject var taskViewModel : TaskViewModel
    @State private var taskToAdd : Task = Task(id : 0, name : "", description : "", isActive : false, finishDate : Date()) 

    @Bindig var showAddTaskView : Bool 

    var body : some View{

        NavigationStack{
            List{
                Section(header : Text("Task Detail")){
                    TextField("Task Name", text: $taskToAdd.name)
                    TextEditor(text : $taskToAdd.description)

                }

                Section(header : Text("Task Date / Time")){
                    DatePicker("Task Date",selection : $taskToAdd.finishDate)
                }
            }

            .navigationTitle("Add TAsk")
            .toolbar{
                ToolbarItem(placement : .navigationBarLeading){
                    Button{
                        showAddTaskView = false
                    }label{
                        Text("Cancel")
                    }
                }
            }

            .toolbar{
                ToolbarItem(placement : .navigationBarTrailing){
                    Button{
                        print("Add button tapped")
                    }label{
                        Text("Add")
                    }
                }
            }

        }
    }
}


struct addTask_Preview : PrviewProvider{
    static var preview : some View{
        AddTaskView(taskViewModel : TaskViewModel(), showAddTaskView : .constant(false))
    }
}
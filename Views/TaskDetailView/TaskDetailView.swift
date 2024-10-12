
struct TaskDetailView : some View{

    @ObservedObject var taskViewModel : taskViewModel
    @Bindig var showTaskDetailView : Bool
    @Bindig var selectedTask : Task

    var body : some View{
        NavigationTack{
             List{
                Section(header : Text("Task Detail")){
                    TextField("Task Name", text: $selectedTask.name)
                    TextEditor(text : $selectedTask.description)
                    Toggle("Mark Complete", isOn : $selectedTask.isCompleted)
                }

                Section(header : Text("Task Date / Time")){
                    DatePicker("Task Date",selection : $selectedTask.finishDate)
                }

                Section{
                    Button{

                    }label{
                        Text("Delete")
                            .fontWeight(.bold)
                            .forgroundColor(.red)
                            .frame(maxWidth : .infinity,alignment: .center)
                    }
                }
            }

            .navigationTitle("Task Details")
            .toolbar{
                ToolbarItem(placement : .navigationBarLeading){
                    Button{
                        showTaskDetailView = false
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
                        Text("Update")
                    }
                }
            }

        }
    }
}

struct TaskDetailView_Preview : some View{

    static var preview : some View{
        TaskDetailView(taskViewModel : TaskViewModel(), showTaskDetailView : .constant(false) selectedTask : .constant(Task.createMockTask().first!))
    }
}
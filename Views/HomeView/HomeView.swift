//SwiftUI View file

import SwiftUI

struct HomeView : some View{

    @SateObject var taskViewModel = TaskViewModel();
    @State private var pickerFilters : [String] = ["Active", "Completed"]
    @State private var defaultPickerSelectionItem : String = "Active"
    @State private var showAddTaskView : Bool = false
    @State private var showTaskDetailView : Bool = false
    @State private var selectedTask : Task = Task(id : 0, name : "", description : "", isCompleted : false, finishDate : Date())
    var body : some View{
        
        NavigationStack{

            Picker("Picker Filter", selection: $defaultPickerSelectionItem){
                ForEach(pickerFilters, id : \.self){
                    Text($0)
                }
            }.pickerStyle(.segmeneted)
                .onChange(of : defaultPickerSelectionItem){ newValue in
                    taskViewModel.getTask(isActive : defaultPickerSelectionItem == "Active")

                }


            List(taskViewModel.tasks, id : \.self){ task in 

                VStack(alignment : .leading){
                    Text(task.name)
                        .font(.title)

                    HStack{
                        Text(task.description)
                            .font(.subheadline)

                        Spacer()
                        // Text("\(task.finishDate)")

                        Text(task.finishDate.toString())

                    }
                }.onTapGesture{
                    selectedTask = task
                    showTaskDetailView.toggle()
                }


            }.onAppear{
                taskViewModel.getTask(isActive : true)
            }.listStyle(.plain)

            .navigationTite("Home")
            .toolbar{
                ToolbarItem(placement : .nevigationBarTrailing){
                    Button{
                        showAddTaskView = true
                    }label:{
                        Image(systemName : "plus")
                    }
                }
            }

            .sheet(isPresented : $showAddTaskView){
                AddTaskView(taskViewModel : taskViewModel, showAddTaskView : $showAddTaskView)
            }

            .sheet(isPresented : $showTaskDetailView){
                TaskDetailView(taskViewModel : taskViewModel, showTaskDetailView : $showTaskDetailView, selectedTask : $selectedTask)
            }
        }
        
    } 
}
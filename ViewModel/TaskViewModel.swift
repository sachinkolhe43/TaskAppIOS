
import Foundation

final class TaskViewModel : ObservableObject{

    @Published var tasks : [Task] = []

     func getTasks(isActive : Bool){
        task = Task.createMockTask().filter({$0.isActive == !isActive})
     }
}
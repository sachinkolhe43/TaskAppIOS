
struct Task {
    let id : Int
    var name : String
    var description : String
    var isCompleted : Bool
    var finishDate : Date

    static func createMockTask() -> [Task]{
        return [
            Task(id : 1, name : "Go to Office", description : "Speak on Women Safty", isCompleted : true, finishDate :Date()),
            Task(id : 2, name : "Do Exercicise", description : "Speak on Women Safty", isCompleted : false, finishDate :Date()),
            Task(id : 3, name : "Spend your time with family", description : "Speak on Women Safty", isCompleted : true, finishDate :Date()),
        ]

    }
}
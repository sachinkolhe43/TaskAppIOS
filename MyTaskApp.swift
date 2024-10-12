
import SwiftUI

@main
struct MyTaskApp: App{
    let persistenceController = PersistenceController.shared

    var body : some Scene {
        WindowsGroup{
            HomeView()
        }
    }
}

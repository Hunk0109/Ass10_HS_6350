import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CustomerListView()
                .tabItem {
                    Label("Customers", systemImage: "person.fill")
                }
            
            PolicyListView()
                .tabItem {
                    Label("Policies", systemImage: "scroll.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

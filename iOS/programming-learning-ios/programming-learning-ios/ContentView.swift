import ComposableArchitecture
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    GitHubView(store: Store(initialState: GitHubReducer.State()) { GitHubReducer() } )
                } label: {
                    Text(verbatim: "TCA")
                }

                NavigationLink {
                    SwiftDataView()
                } label: {
                    Text(verbatim: "SwiftData")
                }

                NavigationLink {
                    NutrientsView()
                } label: {
                    Text(verbatim: "Nutrients")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

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
            }
        }
    }
}

#Preview {
    ContentView()
}

import ComposableArchitecture
import SwiftUI

struct TopView: View {
    let store: StoreOf<GitHubReducer>

    var body: some View {
        NavigationLink {
            Text("\(store.item) detial")
        } label: {
            Text(store.item)
        }
        .onAppear {
            store.send(.onAppear)
        }
    }
}


#Preview {
    NavigationStack {
        TopView(store: Store(initialState: GitHubReducer.State()) { GitHubReducer() } )
    }
}

import ComposableArchitecture
import SwiftUI

struct GitHubView: View {
    let store: StoreOf<GitHubReducer>

    var body: some View {
        List {
            if let response = store.item {
                ForEach(response.items) { item in
                    itemView(item)
                }
            }
        }
        .onAppear {
            store.send(.onAppear)
        }
    }
}

extension GitHubView {
    private func itemView(_ item: RepositoryResponse.Item) -> some View {
        NavigationLink {
            Text("\(item.fullName) detial")
        } label: {
            Text(item.fullName)
        }
    }
}

#Preview {
    NavigationStack {
        GitHubView(store: Store(initialState: GitHubReducer.State()) { GitHubReducer() } )
    }
}

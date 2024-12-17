import ComposableArchitecture
import SwiftUI

struct GitHubView: View {
    @Bindable var store: StoreOf<GitHubReducer>
    @State private var searchText = ""

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
        .searchable(text: $store.searchText.sending(\.searchTextChanged))
        .onSubmit(of: .search) {
            store.send(.search)
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

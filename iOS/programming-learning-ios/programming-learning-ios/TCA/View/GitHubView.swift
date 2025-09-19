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
            GitHubItemView(item: item)
        } label: {
            VStack(alignment: .leading) {
                HStack(spacing: 0) {
                    Text(item.name)
                        .font(.body)
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    Text("\(item.stargazersCount)")
                        .font(.callout)
                }
                Text(item.description ?? "")
                    .font(.caption)
                    .lineLimit(1)
            }
        }
    }
}

#Preview {
    NavigationStack {
        GitHubView(store: Store(initialState: GitHubReducer.State()) { GitHubReducer() } )
    }
}

import SwiftUI

struct GitHubItemView: View {
    let item: RepositoryResponse.Item

    var body: some View {
        Text("\(item.fullName) detial")
    }
}

#Preview {
    NavigationStack {
        let item = RepositoryResponse.Item(id: 1, nodeId: "", name: "swift", fullName: "swiftlang/swift", private: false, htmlUrl: "https://github.com/swiftlang/swift", description: "Swift Programming Language", stargazersCount: 999_999, watchersCount: 0)
        GitHubItemView(item: item)
    }
}

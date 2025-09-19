import ComposableArchitecture
import SwiftUI

struct RxSwiftGitHubView: View {
    @State private var items = [RepositoryResponse.Item]()
    @State private var searchText = ""

    var body: some View {
        List {
            if !items.isEmpty {
                ForEach(items) { item in
                    itemView(item)
                }
            }
        }
        .searchable(text: $searchText)
    }
}

extension RxSwiftGitHubView {
    private func itemView(_ item: RepositoryResponse.Item) -> some View {
        NavigationLink {
            Text("\(item.fullName) detial")
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
                Text(item.description)
                    .font(.caption)
                    .lineLimit(1)
            }
        }
    }
}

#Preview {
    NavigationStack {
        RxSwiftGitHubView()
    }
}

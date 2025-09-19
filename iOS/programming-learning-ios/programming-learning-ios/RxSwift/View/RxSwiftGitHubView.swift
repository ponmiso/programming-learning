import ComposableArchitecture
import SwiftUI

struct RxSwiftGitHubView: View {
    @StateObject private var viewModel = RxSwiftGitHubViewModel()

    var body: some View {
        List {
            if !viewModel.items.isEmpty {
                ForEach(viewModel.items) { item in
                    itemView(item)
                }
            }
        }
        .searchable(text: $viewModel.searchText)
        .task { await viewModel.task() }
        .onSubmit(of: .search) { viewModel.onSubmitSearch() }
    }
}

extension RxSwiftGitHubView {
    private func itemView(_ item: RepositoryResponse.Item) -> some View {
        NavigationLink {
            Text(verbatim: "\(item.fullName) detial")
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

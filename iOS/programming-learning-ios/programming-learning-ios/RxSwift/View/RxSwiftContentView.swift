import ComposableArchitecture
import SwiftUI

struct RxSwiftContentView: View {
    @StateObject private var viewModel = RxSwiftContentViewModel()

    var body: some View {
        List {
            if !viewModel.items.isEmpty {
                ForEach(viewModel.items) { item in
                    itemView(item)
                }
            }
        }
        .searchable(text: $viewModel.searchText)
        .onAppear { viewModel.onAppear() }
        .onSubmit(of: .search) { viewModel.onSubmitSearch() }
    }
}

extension RxSwiftContentView {
    private func itemView(_ item: RxSwiftContentItemData) -> some View {
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
        RxSwiftContentView()
    }
}

import SwiftUI

@MainActor
final class RxSwiftContentViewModel: ObservableObject {
    @Published var searchText = "Swift"
    @Published var items = [RepositoryResponse.Item]()
}

extension RxSwiftContentViewModel {
    func task() async {
        fetchRepositories()
    }

    func onSubmitSearch() {
        fetchRepositories()
    }
}

extension RxSwiftContentViewModel {
    private func fetchRepositories() {
        Task {
            do {
                let response = try await API().getRepositories(searchText: searchText)
                let sortedItems = response.items.sorted(by: { $0.stargazersCount > $1.stargazersCount })
                items = sortedItems
            } catch {
                print("getRepositories error: ", error)
            }
        }
    }
}

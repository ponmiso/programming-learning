import SwiftUI

@MainActor
final class RxSwiftGitHubViewModel: ObservableObject {
    @Published var searchText = "Swift"
    @Published var items = [RepositoryResponse.Item]()
}

extension RxSwiftGitHubViewModel {
    func task() async {
        do {
            let response = try await API().getRepositories(searchText: searchText)
            let sortedItems = response.items.sorted(by: { $0.stargazersCount > $1.stargazersCount })
            items = sortedItems
        } catch {
            print("getRepositories error: ", error)
        }
    }
}

import SwiftUI

struct RxSwiftContentData {
    let totalCount: Int
    let items: [RxSwiftContentItemData]
}

struct RxSwiftContentItemData: Identifiable {
    let id: Int
    let name: String
    let fullName: String
    let description: String
    let stargazersCount: Int
}

@MainActor
final class RxSwiftContentViewModel: ObservableObject {
    private let getRepositoriesUseCase: GetRepositoriesUserCaseProtocol

    @Published var searchText = "Swift"
    @Published var items = [RxSwiftContentItemData]()

    init(getRepositoriesUseCase: GetRepositoriesUserCaseProtocol = GetRepositoriesUserCase()) {
        self.getRepositoriesUseCase = getRepositoriesUseCase
    }
}

extension RxSwiftContentViewModel {
    func onAppear() {
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
                let input = GetRepositoriesInputData(searchText: searchText)
                let output = try await getRepositoriesUseCase.execute(input: input)
                items = output.items.map {
                    RxSwiftContentItemData(id: $0.id, name: $0.name, fullName: $0.fullName, description: $0.description, stargazersCount: $0.stargazersCount)
                }
            } catch {
                print("getRepositories error: ", error)
            }
        }
    }
}

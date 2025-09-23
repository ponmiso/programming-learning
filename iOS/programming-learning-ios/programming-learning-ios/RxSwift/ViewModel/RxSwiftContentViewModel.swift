import RxSwift
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
    private let disposeBag = DisposeBag()

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
        let input = GetRepositoriesInputData(searchText: searchText)
        getRepositoriesUseCase.executeRx(input: input)
            .subscribe(
                onSuccess: { [weak self] output in
                    self?.items = output.items.map {
                        RxSwiftContentItemData(id: $0.id, name: $0.name, fullName: $0.fullName, description: $0.description, stargazersCount: $0.stargazersCount)
                    }
                }, onFailure: { error in
                    print("getRepositories error: ", error)
                }
            )
            .disposed(by: disposeBag)
    }
}

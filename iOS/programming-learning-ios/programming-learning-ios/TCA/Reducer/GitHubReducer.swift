import ComposableArchitecture

@Reducer
struct GitHubReducer {
    @ObservableState
    struct State: Equatable {
        var searchText = "Swift"
        var item: RepositoryResponse? = nil
    }

    enum Action {
        case onAppear
        case searchTextChanged(String)
        case search
        case searchRepositoryResponse(Result<RepositoryResponse, any Error>)
    }

    private enum CancelID { case searchRepositoryRequest }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { [searchText = state.searchText] send in
                  await send(
                    .searchRepositoryResponse(Result { try await API().getRepositories(searchText: searchText) }),
                    animation: .default
                  )
                }
                .cancellable(id: CancelID.searchRepositoryRequest)
            case let .searchTextChanged(searchText):
                state.searchText = searchText
                return .none
            case .search:
                return .run { [searchText = state.searchText] send in
                  await send(
                    .searchRepositoryResponse(Result { try await API().getRepositories(searchText: searchText) }),
                    animation: .default
                  )
                }
                .cancellable(id: CancelID.searchRepositoryRequest)
            case let .searchRepositoryResponse(.success(_response)):
                var response = _response
                response.items.sort { $0.stargazersCount > $1.stargazersCount }
                state.item = response
                return .none
            case .searchRepositoryResponse(.failure):
                // NB: This is where you could do some error handling.
                return .none
            }
        }
    }
}

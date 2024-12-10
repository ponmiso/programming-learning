import ComposableArchitecture

@Reducer
struct GitHubReducer {
    @ObservableState
    struct State: Equatable {
        var searchText = "Swift"
        var item: RepositoryResponse?
    }

    enum Action {
        case onAppear
        case searchRepositoryResponse(Result<RepositoryResponse, any Error>)
    }

    private enum CancelID { case searchRepositoryRequest }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            state.item = nil
            switch action {
            case .onAppear:
                return .run { [searchText = state.searchText] send in
                  await send(
                    .searchRepositoryResponse(Result { try await API().getRepositories(searchText: searchText) }),
                    animation: .default
                  )
                }
                .cancellable(id: CancelID.searchRepositoryRequest)
            case let .searchRepositoryResponse(.success(response)):
                state.item = response
                return .none
            case .searchRepositoryResponse(.failure):
                // NB: This is where you could do some error handling.
                return .none
            }
        }
    }
}

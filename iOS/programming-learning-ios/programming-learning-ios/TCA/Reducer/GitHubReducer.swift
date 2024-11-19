import ComposableArchitecture

@Reducer
struct GitHubReducer {
    @ObservableState
    struct State: Equatable {
        // TODO: GitHubの情報にする？
        var item = ""
    }

    enum Action {
        case onAppear
    }

    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.item = ["apple", "orange", "banana"].randomElement() ?? ""
                return .none
            }
        }
    }
}

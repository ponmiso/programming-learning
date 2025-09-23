import OpenAPIRuntime
import OpenAPIURLSession
import RxSwift

struct API {
    let client: Client

    init() {
        guard let serverURL = try? Servers.Server1.url() else {
            fatalError()
        }
        client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport()
        )
    }
}

extension API {
    func getRepositories(searchText: String = "") async throws -> RepositoryResponse {
        let json = try await client.searchRepositories(query: .init(q: searchText)).ok.body.json
        return RepositoryResponse(json)
    }

    // データトレースの警告を解消するのが難しいのでとりあえずメインスレッドで実行するようにした
    @MainActor
    func getRepositoriesRx(searchText: String = "") -> Single<RepositoryResponse> {
        return Single<RepositoryResponse>.create { observer in
            let task = Task {
                do {
                    let response = try await getRepositories(searchText: searchText)
                    try Task.checkCancellation()
                    observer(.success(response))
                } catch {
                    observer(.failure(error))
                }
            }
            return Disposables.create { task.cancel() }
        }
    }
}

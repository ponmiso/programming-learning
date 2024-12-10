import OpenAPIRuntime
import OpenAPIURLSession

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
}

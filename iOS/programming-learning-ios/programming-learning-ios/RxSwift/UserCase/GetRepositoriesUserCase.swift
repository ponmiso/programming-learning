@MainActor
protocol GetRepositoriesUserCaseProtocol {
    func execute(input: GetRepositoriesInputData) async throws -> GetRepositoriesOuptPutData
}

struct GetRepositoriesInputData {
    let searchText: String
}

struct GetRepositoriesOuptPutData {
    let totalCount: Int
    let items: [GetRepositoriesItemOuptPutData]
}

struct GetRepositoriesItemOuptPutData {
    let id: Int
    let nodeId: String
    let name: String
    let fullName: String
    let `private`: Bool
    let htmlUrl: String
    let description: String
    let stargazersCount: Int
    let watchersCount: Int
}

struct GetRepositoriesUserCase: GetRepositoriesUserCaseProtocol {
    func execute(input: GetRepositoriesInputData) async throws -> GetRepositoriesOuptPutData {
        let response = try await API().getRepositories(searchText: input.searchText)
        let items = response.items
            .sorted(by: { $0.stargazersCount > $1.stargazersCount })
            .map {
                GetRepositoriesItemOuptPutData(
                    id: $0.id,
                    nodeId: $0.nodeId,
                    name: $0.name,
                    fullName: $0.fullName,
                    private: $0.private,
                    htmlUrl: $0.htmlUrl,
                    description: $0.description ?? "",
                    stargazersCount: $0.stargazersCount,
                    watchersCount: $0.watchersCount
                )
            }
        return GetRepositoriesOuptPutData(totalCount: response.totalCount, items: items)
    }
}

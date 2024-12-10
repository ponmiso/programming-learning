struct RepositoryResponse: Codable, Equatable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Item]

    struct Item: Codable, Equatable, Identifiable {
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
}

extension RepositoryResponse {
    init(_ json: Operations.searchRepositories.Output.Ok.Body.jsonPayload) {
        let items = json.items.map { Item(id: $0.id, nodeId: $0.node_id, name: $0.name, fullName: $0.full_name, private: $0._private, htmlUrl: $0.html_url, description: $0.description, stargazersCount: $0.stargazers_count, watchersCount: $0.watchers_count)
        }
        self.init(totalCount: json.total_count, incompleteResults: json.incomplete_results, items: items)
    }
}

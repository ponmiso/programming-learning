import OpenAPIRuntime
import OpenAPIURLSession

struct API {
    init() {
        // TODO: とりあえずアクセスできるか確認しただけ
        guard let serverURL = try? Servers.Server1.url() else {
            return
        }
        let client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport()
        )
    }
}

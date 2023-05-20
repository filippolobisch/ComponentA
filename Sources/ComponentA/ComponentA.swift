import Vapor


@main
struct ComponentA {
    static func main() async throws {
        let env = try Environment.detect()
        
        let app = Application(env)
        defer { app.shutdown() }
        
        try Routes.register(app: app)
        try app.run()
    }
}

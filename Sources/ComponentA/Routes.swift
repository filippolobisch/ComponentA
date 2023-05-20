import Foundation
import Vapor


struct Routes {
    
    private init() {}
    
    static func register(app: Application) throws {
        app.get("", use: Self.index)
        app.post("echo", use: Self.echo)
    }
    
    static func index(request: Request) async throws -> String {
        return "Welcome from Component A!"
    }
    
    static func echo(request: Request) async throws -> String {
        if let body = request.body.string {
            return body
        }
        return ""
    }
}

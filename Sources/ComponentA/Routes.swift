import Foundation
import Vapor


struct Routes {
    let mainController = MainController()
    
    func register(app: Application) throws {
        app.get("", use: self.index)
        app.post("echo", use: self.echo)
        app.get("stress", use: self.stress)
        app.on(.POST, "receiveFile", body: .collect(maxSize: "65mb"), use: self.receiveFile)
    }
    
    func index(request: Request) async throws -> String {
        return "Welcome from Component A!"
    }
    
    func echo(request: Request) async throws -> String {
        if let body = request.body.string {
            return body
        }
        return ""
    }
    
    func stress(request: Request) async throws -> Bool {
        try await mainController.constantTask()
        return true
    }
    
    func receiveFile(request: Request) async throws -> Bool {
        guard let bodyData = request.body.data else { return false }
        let data = Data(buffer: bodyData)
        let result = try await mainController.receive(data: data)
        return result
    }
}

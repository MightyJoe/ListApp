@testable import App
import XCTVapor

final class AppTests: XCTestCase {
    var app: Application!
    
    override func setUp() async throws {
        self.app = try await Application.make(.testing)
        try await configure(app)
    }
    
    override func tearDown() async throws { 
        try await self.app.asyncShutdown()
        self.app = nil
    }
    
    func testHelloWorld() async throws {
        try await self.app.test(.GET, "test", afterResponse: { res async in
            XCTAssertEqual(res.status, .ok)
            XCTAssertEqual(res.body.string, "TEST!")
        })
    }
}

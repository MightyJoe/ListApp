import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("test") { req async -> String in
        "TEST!"
    }
}

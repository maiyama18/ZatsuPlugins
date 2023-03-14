import Foundation
import PackagePlugin

@main
struct CreateDirectoryPlugin: CommandPlugin {
    func performCommand(context: PackagePlugin.PluginContext, arguments: [String]) async throws {
        var argumentsExtractor = ArgumentExtractor(arguments)
        let pathStrings = argumentsExtractor.extractOption(named: "path")

        guard let pathString = pathStrings.first else {
            Diagnostics.error("--path should be provided")
            return
        }
        
        do {
            try FileManager.default.createDirectory(
                atPath: pathString,
                withIntermediateDirectories: true
            )
            print("Directory created at \(pathString)")
        } catch {
            Diagnostics.error("Failed to create directory: \(error)")
        }
    }
}

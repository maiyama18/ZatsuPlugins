// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "ZatsuPlugins",
    products: [
        .plugin(name: "CreateDirectoryPlugin", targets: ["CreateDirectoryPlugin"])
    ],
    dependencies: [],
    targets: [
        .plugin(
            name: "CreateDirectoryPlugin",
            capability: .command(
                intent: .custom(
                    verb: "create-directory",
                    description: "Create a directory"
                )
            )
        )
    ]
)

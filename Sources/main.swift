import Foundation
import OctoKit

let env = ProcessInfo.processInfo.environment
let token = env["GITHUB_TOKEN"]!
let config = TokenConfiguration(token)

let user = try! await Octokit(config).me()
print(user.name!)

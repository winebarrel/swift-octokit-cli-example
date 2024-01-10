import Foundation
import OctoKit

let env = ProcessInfo.processInfo.environment
let token = env["GITHUB_TOKEN"]!
let config = TokenConfiguration(token)

let octokit = Octokit(config)
let user = try! await octokit.me()
print(user.name!)

// async未対応の場合
let ns = try! await withCheckedThrowingContinuation { continuation in
    octokit.myNotifications { response in
        switch response {
        case let .success(notifications):
            continuation.resume(returning: notifications)
        case let .failure(error):
            continuation.resume(throwing: error)
        }
    }
}

for n in ns {
    print(n.subject.title!)
}

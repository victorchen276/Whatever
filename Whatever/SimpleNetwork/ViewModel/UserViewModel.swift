//
//  UserViewModel.swift
//  Whatever
//
//  Created by Chen Yue on 19/08/20.
//  Copyright © 2020 Mt. Zendo. All rights reserved.
//

import Foundation

class UserViewModel {

    private let networking = Networking()

    private var user: User?

    public func user(login: String, completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: GitHubAPI.user(login: login), type: User.self) { [weak self] (response) in
            self?.user = response
            completion?()
        }
    }

    public var imageURL: URL? {
        return URL(string: user?.avatar_url ?? "")
    }

    public var username: String {
        return user?.login ?? ""
    }

    public var name: String {
        return user?.name ?? ""
    }

    public var bio: String {
        return user?.bio ?? ""
    }

}

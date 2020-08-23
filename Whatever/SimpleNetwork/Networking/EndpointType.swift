//
//  EndpointType.swift
//  Whatever
//
//  Created by Chen Yue on 19/08/20.
//  Copyright © 2020 Mt. Zendo. All rights reserved.
//

import Foundation

protocol EndpointType {

    var baseURL: URL { get }

    var path: String { get }

}

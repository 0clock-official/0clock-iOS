//
//  Dependencies.swift
//  
//
//  Created by 홍경표 on 2022/10/09.
//

import ProjectDescription

/// Fetch dependencies, make frameworks
let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: [
        .remote(url: "https://github.com/devxoul/Then", requirement: .exact("3.0.0")), // Then
    ],
    platforms: [.iOS]
)

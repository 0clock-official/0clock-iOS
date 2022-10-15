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
        .remote(url: "https://github.com/Swinject/Swinject", requirement: .exact("2.8.2")), // Swinject
        .remote(url: "https://github.com/Alamofire/Alamofire", requirement: .exact("5.6.2")), // Alamofire
    ],
    platforms: [.iOS]
)

//
//  Project.swift
//  Manifests
//
//  Created by 홍경표 on 2022/10/09.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ThirdPartyManager",
    product: .framework,
    dependencies: [
        .external(name: "Then")
    ]
)

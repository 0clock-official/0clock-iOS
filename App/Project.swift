//
//  Project.swift
//  Manifests
//
//  Created by 홍경표 on 2022/10/09.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.project(
    name: TemplateConstants.appName,
    product: .app,
    packages: [],
    dependencies: [
        .ThirdPartyManager,
    ],
    infoPlist: "Supporting/Info.plist",
    sources: [
        .sources,
    ],
    resources: .resources(with: [
        .assets
    ]),
    settings: .settings(base: [:]),
    schemes: []
)

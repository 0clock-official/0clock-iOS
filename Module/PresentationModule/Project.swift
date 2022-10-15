//
//  Project.swift
//  Manifests
//
//  Created by 홍경표 on 2022/03/18.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "PresentationModule",
    product: .framework,
    dependencies: [
        .DomainModule,
    ],
    resources: .resources(with: [.assets])
)

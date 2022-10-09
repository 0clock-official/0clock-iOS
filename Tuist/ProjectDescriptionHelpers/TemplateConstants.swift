//
//  TemplateConstants.swift
//  ProjectDescriptionHelpers
//
//  Created by 홍경표 on 2022/10/09.
//

import ProjectDescription

public enum TemplateConstants {
    public static let appName: String = "Oclock"
    public static let defaultDeploymentTarget = DeploymentTarget.iOS(targetVersion: "15.0", devices: .iphone)
    public static let organizationName: String = "com.oclock"
}

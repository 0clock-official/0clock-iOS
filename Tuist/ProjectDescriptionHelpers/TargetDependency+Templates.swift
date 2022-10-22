//
//  TargetDependency+Templates.swift
//  ProjectDescriptionHelpers
//
//  Created by 홍경표 on 2022/10/09.
//

import ProjectDescription

/// Modules
extension TargetDependency {
    public static let PresentationModule: TargetDependency = .project(
        target: "PresentationModule",
        path: .relativeToRoot("PresentationModule")
    )
    public static let DomainModule: TargetDependency = .project(
        target: "DomainModule",
        path: .relativeToRoot("Module/DomainModule")
    )
    public static let DataModule: TargetDependency = .project(
        target: "DataModule",
        path: .relativeToRoot("Module/DataModule")
    )
    public static let NetworkModule: TargetDependency = .project(
        target: "NetworkModule",
        path: .relativeToRoot("Module/NetworkModule")
    )
    public static let InjectionManager: TargetDependency = .project(
        target: "InjectionManager",
        path: .relativeToRoot("Module/InjectionManager")
    )
    public static let ThirdPartyManager: TargetDependency = .project(
        target: "ThirdPartyManager",
        path: .relativeToRoot("Module/ThirdPartyManager")
    )
}

/// Package Products
extension TargetDependency {
    public struct SPM {
        public static let Then = TargetDependency.external(name: "Then")
        public static let Swinject = TargetDependency.external(name: "Swinject")
        public static let Alamofire = TargetDependency.external(name: "Alamofire")
    }
}

/// Source
public extension SourceFileGlob {
    static let sources = SourceFileGlob("Sources/**")
    static let tests = SourceFileGlob("Tests/**")
}

/// Resource
public enum ResourceType: String {
    case xibs = "Sources/**/*.xib"
    case storyboards = "Resources/**/*.storyboard"
    case assets = "Resources/**"
}

public extension ResourceFileElements {
    static func resources(with resources: [ResourceType]) -> ResourceFileElements {
        return .init(
            resources: resources.map({ ResourceFileElement(stringLiteral: $0.rawValue) })
        )
    }
}

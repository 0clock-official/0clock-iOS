//
//  TempTests.swift
//  NetworkModuleTests
//
//  Created by 홍경표 on 2022/10/15.
//  Copyright © 2022 com.oclock. All rights reserved.
//

import XCTest
@testable import NetworkModule
import Alamofire

class TempTests: XCTestCase {
    enum TempEndpoint: EndpointType {
        case randomQuotes

        var baseURL: String { "https://animechan.vercel.app" }

        var path: String { "api/quotes" }

        var method: HTTPMethod { .get }

        var parameters: RequestParams? { nil }

        var headers: HTTPHeaders? { nil }
    }

    struct Quote: Decodable {
        let anime: String
        let character: String
        let quote: String
    }

    func test_temp() {
        let networkManager = NetworkManagerImpl()
        let endpoint = TempEndpoint.randomQuotes
        let expectation = expectation(description: "temp")
        Task {
            let quotes: [Quote] = try await networkManager.fetch(from: endpoint)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail(error.localizedDescription)
            }
        }
    }
}

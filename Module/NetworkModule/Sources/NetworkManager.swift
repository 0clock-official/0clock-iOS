//
//  NetworkManager.swift
//  NetworkModule
//
//  Created by 홍경표 on 2022/10/15.
//  Copyright © 2022 com.oclock. All rights reserved.
//

import Foundation
import Alamofire

public protocol NetworkManager {
    func fetch<T: Decodable>(
        from endpoint: EndpointType
    ) async throws -> T
}

public final class NetworkManagerImpl: NetworkManager {

    private let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        let apiLogger = APIEventLogger()
        return Session(configuration: configuration, eventMonitors: [apiLogger])
    }()

    public init() {}

    public func fetch<T: Decodable>(
        from endpoint: EndpointType
    ) async throws -> T {
        return try await session.request(endpoint).serializingDecodable(T.self).value
    }
}

class APIEventLogger: EventMonitor {

    let queue = DispatchQueue(label: "NetworkLogger")

    func requestDidFinish(_ request: Request) {
        #if DEBUG
        print("\n-------- 🛰 NETWORK Request LOG --------")
        print(request.description)
        print("URL: " + (request.request?.url?.absoluteString ?? ""))
        print("Method: " + (request.request?.httpMethod ?? ""))
        print("Headers: " + "\(request.request?.allHTTPHeaderFields ?? [:])")
        print("Body: " + (request.request?.httpBody?.toPrettyPrintedString ?? ""))
        print("----------------------------------------\n")
        #endif
    }

    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        #if DEBUG
        print("\n-------- 🛰 NETWORK Response LOG --------")
        print("URL: " + (request.request?.url?.absoluteString ?? ""))
        print("Result: " + "\(response.result)")
        print("StatusCode: " + "\(response.response?.statusCode ?? 0)")
        print("Data: \(response.data?.toPrettyPrintedString ?? "")")
        print("----------------------------------------\n")
        #endif
    }
}

extension Data {
    var toPrettyPrintedString: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        return prettyPrintedString as String
    }
}

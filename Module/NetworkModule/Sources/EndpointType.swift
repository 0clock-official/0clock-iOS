//
//  EndpointType.swift
//  NetworkModule
//
//  Created by 홍경표 on 2022/10/15.
//  Copyright © 2022 com.oclock. All rights reserved.
//

import Foundation
import Alamofire

public protocol EndpointType: URLRequestConvertible {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: RequestParams? { get }
    var headers: HTTPHeaders? { get }
}

public extension EndpointType {
    func asURLRequest() throws -> URLRequest {
        var url = try baseURL.asURL()
        url.appendPathComponent(path)

        var urlRequest = try URLRequest(
            url: url,
            method: method,
            headers: headers
        )

        guard let parameters = parameters else { return urlRequest }

        switch parameters {
        case .query(let request):
            let params = try request?.toDictionary() ?? [:]
            var components = URLComponents(string: url.absoluteString)
            components?.queryItems = params.map {
                URLQueryItem(name: $0.key, value: "\($0.value)")
            }
            urlRequest.url = components?.url

        case .body(let request):
            guard let requestBody = request else { break }
            urlRequest.httpBody = try requestBody.toData()
        }

        return urlRequest
    }
}

public enum RequestParams {
    case query(_ parameter: Encodable?)
    case body(_ parameter: Encodable?)
}

extension Encodable {
    func toDictionary() throws -> [String: Any]? {
        let data = try JSONEncoder().encode(self)
        let jsonData = try JSONSerialization.jsonObject(with: data)
        let dictionaryData = jsonData as? [String: Any]
        return dictionaryData
    }

    func toData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
}

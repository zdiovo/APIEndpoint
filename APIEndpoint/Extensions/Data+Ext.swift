//
//  File.swift
//  APIEndpoint
//
//  Created by pc2020 on 2021/2/25.
//

import Foundation
import ZippyJSON

extension Data {
    func toString() -> String {
        return String(data: self, encoding: .utf8) ?? ""
    }
    
    func JSON<T: Codable>(to model: T.Type) -> T? {
        return try? ZippyJSONDecoder().decode(T.self, from: self)
    }
}

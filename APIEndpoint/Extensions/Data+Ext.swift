//
//  File.swift
//  CD
//
//  Created by pc2020 on 2021/2/25.
//

import Foundation

extension Data {
    func toString() -> String {
        return String(data: self, encoding: .utf8) ?? ""
    }
    
    func transform<T: Codable>(to model: T.Type) -> T? {
        return try? newJSONDecoder().decode(T.self, from: self)
    }
}

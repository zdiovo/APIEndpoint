//
//  File.swift
//  APIEndpoint
//
//  Created by pc2020 on 2021/2/25.
//

import Foundation

extension Date {
    static var timeStamp: TimeInterval {
        return Date().timeIntervalSince1970
    }
    static var now: String {
        return Date().timeIntervalSince1970.toDateString()
    }
}

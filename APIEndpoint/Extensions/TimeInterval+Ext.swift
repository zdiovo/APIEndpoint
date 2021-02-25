//
//  TimeInterval+Ext.swift
//  CD
//
//  Created by pc2020 on 2021/2/25.
//

import Foundation
extension TimeInterval {
    func toDateString() -> String {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return df.string(from: Date(timeIntervalSince1970: self))
    }
}

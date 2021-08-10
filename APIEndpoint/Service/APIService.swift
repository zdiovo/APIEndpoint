//
//  APIService.swift
//  APIEndpoint
//
//  Created by pc2020 on 2021/2/25.
//

import Foundation
import JSQCoreDataKit
import CoreData

let endpointURL = "https://api.github.com/"

// MARK: - Helper functions for creating decoders

struct Service {
    private init() {}
}

extension Service {
    struct API {
        private init() {}
    }
}

extension Service.API {
    static func fetchGitAPI(_ handler: @escaping CallBack) {
        let timeStamp = Date.timeStamp
        let task = URLSession.shared.dataTask(with: endpointURL.URL) { (d, _, e) in
            var tempData = Data()
            if let d = d {
                tempData = d
            } else if let e = e {
                tempData = e.localizedDescription.data(using: .utf8) ?? Data()
            } else {
                tempData = "no data, no error".data(using: .utf8) ?? Data()
            }
            handler((tempData, timeStamp))
            CDManage.share.save(data: tempData, timeStamp: timeStamp)
        }
        task.resume()
    }
}


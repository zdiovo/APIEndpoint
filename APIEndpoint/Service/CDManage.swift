//
//  CDManage.swift
//  APIEndpoint
//
//  Created by pc2020 on 2021/2/25.
//

import Foundation
import JSQCoreDataKit
import CoreData
import Repeat
import Combine


typealias PassData = (data: Data, timeStamp: TimeInterval)
typealias CallBack = (PassData) -> Void

final class CDManage {
    static let share = CDManage()
    private init() { }
    var stack: CoreDataStack!
    var frController: NSFetchedResultsController<EndpointData>!
    var endPointDatas: [EndpointData] {
        get {
            try? frController.performFetch()
            if let a = frController.fetchedObjects {
                return a
            }
            return [EndpointData]()
        }
    }
    
    let updateSubject = PassthroughSubject<PassData, Error>()
    
    func prepare(_ then: ((_ share: CDManage) -> Void)?) {
        guard stack == nil else {
            then?(self)
            return
        }
        let model = CoreDataModel(name: moduleName, bundle: moduleBundle)
        let provider = CoreDataStackProvider(model: model)
        provider.createStack { (r) in
            switch r {
            case .success(let s):
                self.stack = s
                self.buildFRC(stack: s)
                then?(self)
                self.callPer5s()
            case .failure(let e):
                assertionFailure("Error creating stack: \(e)")
            }
        }
    }
    
    func buildFRC(stack: CoreDataStack) {
        frController = NSFetchedResultsController(fetchRequest: EndpointData.fetchRequest,
                                                  managedObjectContext: stack.mainContext,
                                                  sectionNameKeyPath: nil, cacheName: nil)
    }
    
    func save(data: Data, timeStamp: TimeInterval) {
        stack.mainContext.performAndWait {
            _ = EndpointData(context: stack.mainContext, timeStamp: timeStamp, jsonData: data)
            stack.mainContext.saveSync()
        }
    }
    
    func fetchLast(_ callBack:@escaping CallBack) {
        if let obj = endPointDatas.first {
            callBack((obj.jsonData, obj.timeStamp))
            return
        }
        let now = Date.timeStamp
        let d = Data()
        callBack((d, now))
    }
    
    var repeater: Repeater?
    func callPer5s() {
        repeater = Repeater.every(.seconds(5)) { (r) in
            APIService.fetchGitAPI { (d, t) in
                self.updateSubject.send((d, t))
            }
        }
        repeater?.start()
    }
}


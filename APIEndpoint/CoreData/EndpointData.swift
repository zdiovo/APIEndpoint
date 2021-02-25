//
//  EndpointData.swift
//  APIEndpoint
//
//  Created by pc2020 on 2021/2/25.
//

import CoreData
import Foundation
import JSQCoreDataKit

public final class EndpointData: NSManagedObject, CoreDataEntityProtocol {


    public static let defaultSortDescriptors = [NSSortDescriptor(key: "timeStamp", ascending: false)]

    // MARK: Properties

    @NSManaged public var timeStamp: Double
    @NSManaged public var jsonData: Data

    // MARK: Init

    public init(context: NSManagedObjectContext,
                timeStamp: Double,
                jsonData: Data) {
        super.init(entity: EndpointData.entity(context: context), insertInto: context)
        self.timeStamp = timeStamp
        self.jsonData = jsonData
    }

    @objc
    override private init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
}


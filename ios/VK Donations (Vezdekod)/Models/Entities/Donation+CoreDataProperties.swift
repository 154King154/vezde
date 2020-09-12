//
//  Donation+CoreDataProperties.swift
//  vk
//
//  Created by lazarevtill on 12.09.2020.
//  Copyright © 2020 lazarevtill. All rights reserved.
//
//

import Foundation
import CoreData


extension Donation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Donation> {
        return NSFetchRequest<Donation>(entityName: "Donation")
    }

    @NSManaged public var image: Data?
    @NSManaged public var title: String?
    @NSManaged public var decriptionText: String?

}

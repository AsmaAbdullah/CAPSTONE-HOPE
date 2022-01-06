//
//  YourSessionsList+CoreDataProperties.swift
//  HOPE
//
//  Created by Asma on 05/01/2022.
//
//

import Foundation
import CoreData


extension YourSessionsList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<YourSessionsList> {
        return NSFetchRequest<YourSessionsList>(entityName: "YourSessionsList")
    }

    @NSManaged public var imageSession: String?
    @NSManaged public var titleSession: String?
    @NSManaged public var uid: String?

}

extension YourSessionsList : Identifiable {

}

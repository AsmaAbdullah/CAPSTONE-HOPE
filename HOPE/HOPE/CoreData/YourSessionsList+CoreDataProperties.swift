//
//  YourSessionsList+CoreDataProperties.swift
//  HOPE
//
//  Created by Asma on 14/12/2021.
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

}

extension YourSessionsList : Identifiable {

}

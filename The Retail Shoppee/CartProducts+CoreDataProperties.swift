//
//  CartProducts+CoreDataProperties.swift
//  The Retail Shoppee
//
//  Created by Rituja Mahajan on 11/05/18.
//  Copyright © 2018 Rituja Mahajan. All rights reserved.
//
//

import Foundation
import CoreData


extension CartProducts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartProducts> {
        return NSFetchRequest<CartProducts>(entityName: "CartProducts")
    }

    @NSManaged public var productName: String?
    @NSManaged public var productPrice: String?

}

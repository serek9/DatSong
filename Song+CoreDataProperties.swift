//
//  Song+CoreDataProperties.swift
//  DatSong
//
//  Created by DAM on 7/3/17.
//  Copyright © 2017 SergioD. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Song {

    @NSManaged var songName: String?
    @NSManaged var artistName: String?

}

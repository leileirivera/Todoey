//
//  Category.swift
//  Todoey
//
//  Created by Leah Rivera on 2/12/18.
//  Copyright © 2018 Lei Rivera. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var color : String = ""
    let items = List<Item>()
}


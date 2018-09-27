//
//  Course.swift
//  NewCourseBook
//
//  Created by Rahul Rawat on 06/09/18.
//  Copyright © 2018 Rahul Rawat. All rights reserved.
//

import Foundation
import RealmSwift

class Course: Object{
    @objc dynamic var name = ""
    @objc dynamic var email = ""
    @objc dynamic var price = ""
    @objc dynamic var imageNSData: NSData?
}

//
//  iOS_ProjectTests.swift
//  iOS-ProjectTests
//
//  Created by Arthur Hatchiguian on 26/02/2018.
//  Copyright © 2018 Arthur Hatchiguian. All rights reserved.
//

import XCTest
@testable import iOS_Project

class iOS_ProjectTests: XCTestCase {
    
    func testInitTask() {
        let task = Task(id: "1234", title: "URGENT", type: .urgent, date: Date(), description: "Finir le project iOS")
            
        XCTAssertEqual("1234", task.id)
        XCTAssertEqual("URGENT", task.title)
        XCTAssertEqual("Finir le project iOS", task.desc)
        XCTAssertEqual(.urgent, task.type)
        
    }
    
    func testInitUser() {
        let user = User(name: "Xavier", picture: #imageLiteral(resourceName: "profile-picture1"), id: "1", email: "xav@menu.lol", desc: "ike player")
        
        XCTAssertEqual("Xavier", user.name)
        XCTAssertEqual("xav@menu.lol", user.email)
        XCTAssertEqual("ike player", user.desc)
        XCTAssertEqual("1", user.id)
        XCTAssertEqual(#imageLiteral(resourceName: "profile-picture1"), user.picture)
    }
    
}

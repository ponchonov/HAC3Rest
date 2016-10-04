//
//  HAC3RestTests.swift
//  HAC3RestTests
//
//  Created by Héctor Cuevas Morfín on 9/2/16.
//  Copyright © 2016 HC. All rights reserved.
//

import XCTest
@testable import HAC3Rest

class HAC3RestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
       
        let dict = ["CODE":"VALUE"]
        
        let url = URL(string: "http://videos360.appdata.mx/get/video")
        RESTMAnager().request(requestMethod: .GET, url: url!, parameters: dict, headers: nil) { (result) in
            print(result)
            
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

//
//  XCTestCase+Helpers.swift
//  FDJTechnicalTest1Tests
//
//  Created by Jaberi  on 20/04/2024.
//

import XCTest

extension XCTestCase {

    func assertNoMemoryLeaks(_ instance: AnyObject?, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance not deallocated", file: file, line: line)
        }
        autoreleasepool {
            // Use an unowned reference to ensure that the instance is not kept alive
            unowned let object = instance
            _ = object
        }
    }
}

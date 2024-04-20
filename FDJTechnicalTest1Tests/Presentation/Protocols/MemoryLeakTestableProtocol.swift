//
//  MemoryLeakTestableProtocol.swift
//  FDJTechnicalTest1Tests
//
//  Created by Jaberi  on 20/04/2024.
//

import XCTest

protocol MemoryLeakTestableProtocol : XCTestCase {
    associatedtype T: AnyObject
    var sut: T! { get set }
}

extension MemoryLeakTestableProtocol {
    func testMemoryLeakSut() {
        autoreleasepool {
            assertNoMemoryLeaks(sut)
            sut = nil
        }
    }
}


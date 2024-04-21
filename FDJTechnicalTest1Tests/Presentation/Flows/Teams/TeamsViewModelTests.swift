//
//  TeamsViewModelTests.swift
//  FDJTechnicalTest1Tests
//
//  Created by Jaberi  on 21/04/2024.
//

import XCTest
@testable import FDJTechnicalTest1

class TeamsViewModelTests: XCTestCase {

    // MARK: - Properties
    var sut: TeamsViewModel!
    private var spy: TeamsInteractorSpy!

    // MARK: - Setup
    override func setUp() {
        super.setUp()
        
        spy = TeamsInteractorSpy()
        sut = TeamsViewModel(teamsInteractor: spy)
       
    }
    
    override func tearDown() {
        sut = nil
        spy = nil
        super.tearDown()
    }
}

// MARK: - MemoryLeakTestableProtocol
extension TeamsViewModelTests: MemoryLeakTestableProtocol {
    func testTeamsViewModelMemoryLeak() {
        testMemoryLeakSut()
    }
}

//
//  LeaguesViewModelTests.swift
//  FDJTechnicalTest1Tests
//
//  Created by Jaberi  on 21/04/2024.
//

import XCTest
@testable import FDJTechnicalTest1

class LeaguesViewModelTests: XCTestCase {

    // MARK: - Properties
    var sut: LeaguesViewModel!
    private var spy: LeaguesInteractorSpy!
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        
        spy = LeaguesInteractorSpy()
        sut = LeaguesViewModel(leaguesInteractor: spy)
        
       
    }
    
    override func tearDown() {
        sut = nil
        spy = nil
        super.tearDown()
    }
}

// MARK: - MemoryLeakTestableProtocol
extension LeaguesViewModelTests: MemoryLeakTestableProtocol {
    func testLeaguesViewModelMemoryLeak() {
        testMemoryLeakSut()
    }
}

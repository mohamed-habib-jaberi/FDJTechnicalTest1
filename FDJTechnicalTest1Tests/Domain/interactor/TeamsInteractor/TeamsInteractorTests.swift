//
//  TeamsInteractorTests.swift
//  FDJTechnicalTest1Tests
//
//  Created by Jaberi  on 21/04/2024.
//

import XCTest
@testable import FDJTechnicalTest1

final class TeamsInteractorTests: XCTestCase {
    
    // MARK: - Properties
    private var spy: TeamsRepositorySpy!
    private var sut: TeamsInteractorImpl!
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        spy = TeamsRepositorySpy()
        sut = TeamsInteractorImpl(teamsRepository: spy)
    }
    
    override func tearDown() {
        sut = nil
        spy = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    // MARK: GetDebtorAccount
    func testGetTeamsListSuccess() async throws {
        // Given
        spy.mockedTeams = TeamSeeds.teamsList
        
        // When
        let teams = try await sut.getTeamsList(strLeague: "")
        
        // Then
        XCTAssertTrue(spy.getTeamsCalled)
        XCTAssertNotNil(teams)
    }
    
    func testGetTeamsListFailure() async throws {
        // Given
        spy.mockedTeams = nil

        do {
            // When
            _ = try await sut.getTeamsList(strLeague: "")
            XCTFail("Should not happen")
        } catch let error {
            // Then
            XCTAssertTrue(spy.getTeamsCalled)
            XCTAssertNotNil(error)
        }
    }
}

//
//  LeaguesInteractorTests.swift
//  FDJTechnicalTest1Tests
//
//  Created by Jaberi  on 21/04/2024.
//

import XCTest
@testable import FDJTechnicalTest1

final class LeaguesInteractorTests: XCTestCase {
    
    // MARK: - Properties
    private var spy: LeagueRepositorySpy!
    private var sut: LeaguesInteractorImpl!
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        spy = LeagueRepositorySpy()
        sut = LeaguesInteractorImpl(leagueRepository: spy)
    }
    
    override func tearDown() {
        sut = nil
        spy = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    // MARK: GetDebtorAccount
    func testGetLeaguesListSuccess() async throws {
        // Given
        spy.mockedLeagues = LeagueSeeds.leaguesList
        
        // When
        let leagues = try await sut.getLeaguesList()
        
        // Then
        XCTAssertTrue(spy.getLeaguesCalled)
        XCTAssertNotNil(leagues)
    }
    
    func testGetLeaguesListFailure() async throws {
        // Given
        spy.mockedLeagues = nil

        do {
            // When
            _ = try await sut.getLeaguesList()
            XCTFail("Should not happen")
        } catch let error {
            // Then
            XCTAssertTrue(spy.getLeaguesCalled)
            XCTAssertNotNil(error)
        }
    }
    
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

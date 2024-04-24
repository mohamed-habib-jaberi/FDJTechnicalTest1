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
    
    func testFilterLeaguesWithEmptySearchText() {
            // Given
          
        let teams = TeamSeeds.teamsList
        sut.teams = teams
        sut.searchText = ""
            
            // When
        sut.filterTeamsbyLeagueName()
            
            // Then
            XCTAssertEqual(sut.filteredTeamsByLeague, teams, "Filtered leagues should be equal to teams when search text is empty")
        }
    
    // MARK: Load Leagues
    
    func testLoadLeagues() async throws {
        // Given
        spy.mockedLeagues = LeagueSeeds.leaguesList
        
        // When
        await sut.loadLeagues()
        
        // Then
        XCTAssertTrue(spy.getLeaguesCalled)
        XCTAssertEqual(sut.status, .hasLeagues)
        XCTAssertEqual(sut.leagues.count, 5)
    }

    func testLoadEmptyLeagues() async throws {
        // Given
        spy.mockedLeagues = []
        
        // When
        await sut.loadLeagues()
        
        // Then
        XCTAssertTrue(spy.getLeaguesCalled)
        XCTAssertEqual(sut.status, .emptyLeagues)
        XCTAssertEqual(sut.leagues.count, 0)
    }
    
    func testLoadLeaguesFailure() async throws {
        // Given
        spy.mockedLeagues = nil
        
        // When
        await sut.loadLeagues()
        
        // Then
        XCTAssertTrue(spy.getLeaguesCalled)
        XCTAssertEqual(sut.status, .onError)
        XCTAssertEqual(sut.leagues.count, 0)
    }
    
    // MARK: Load Teams

    func testLoadTeams() async throws {
        // Given
        spy.mockedTeams = TeamSeeds.teamsList
        
        // When
        await sut.loadTeams(searchText: "ligue")
        
        // Then
        XCTAssertTrue(spy.getTeamsCalled)
        XCTAssertEqual(sut.status, .hasLeagues)
        XCTAssertEqual(sut.teams.count, 3)
    }
    
    func testLoadEmptyTeams() async throws {
        // Given
        spy.mockedTeams = []
        
        // When
        await sut.loadTeams(searchText: "ligue")
        
        // Then
        XCTAssertTrue(spy.getTeamsCalled)
        XCTAssertEqual(sut.status, .emptyLeagues)
        XCTAssertEqual(sut.teams.count, 0)
    }
    
    func testLoadTeamsFailure() async throws {
        // Given
        spy.mockedTeams = nil
        
        // When
        await sut.loadTeams(searchText: "ligue")
        
        // Then
        XCTAssertTrue(spy.getTeamsCalled)
        XCTAssertEqual(sut.status, .onError)
        XCTAssertEqual(sut.teams.count, 0)
    }
}

// MARK: - MemoryLeakTestableProtocol
//extension LeaguesViewModelTests: MemoryLeakTestableProtocol {
//    func testLeaguesViewModelMemoryLeak() {
//        testMemoryLeakSut()
//    }
//}

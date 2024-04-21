//
//  StringHelpersTests.swift
//  FDJTechnicalTest1Tests
//
//  Created by Jaberi  on 21/04/2024.
//

import XCTest
@testable import FDJTechnicalTest1
import SwiftUI

class StringHelpersTests: XCTestCase {

    func testBuildTeamSearchURL_WithValidLeagueName_ReturnsExpectedURL() {
            // Given
            let leagueName = "French Ligue 1"
            
            // When
            let url = leagueName.buildTeamSearchURL()
            
            // Then
            XCTAssertEqual(url, "/search_all_teams.php?l=French%20Ligue%201")
        }
}

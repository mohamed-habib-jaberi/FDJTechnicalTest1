//
//  String+Extensions .swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

/// Constructs the URL for searching teams based on the provided league name.
///
/// - Returns: The constructed endPath string.
/// Exemple d'utilisation :
/// let leagueName = "French Ligue 1"
/// let searchURL = leagueName.buildTeamSearchURL()
/// print(searchURL) // Affiche : "/search_all_teams.php?l=French%20Ligue%201"

extension String {
    func buildTeamSearchURL() -> String {
        // Encode league name to handle spaces and special characters
        guard let encodedLeagueName = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return ""
        }
        
        // Construct the final URL with the league name as a query parameter
        let endpoint = "/search_all_teams.php"
        let path = "\(endpoint)?l=\(encodedLeagueName)"
        
        return path
    }
}

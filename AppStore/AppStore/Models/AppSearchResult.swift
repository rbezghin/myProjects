//
//  AppSearchResult.swift
//  AppStore
//
//  Created by Radomyr Bezghin on 12/9/20.
//

import Foundation

///response from search query
class AppSearchResult: Decodable{
    
    let resultCount: Int
    
    let results: [Result]
    
}
///result that is used to display apps in the search queury
class Result: Decodable{
    
    let trackName: String
    
    let primaryGenreName: String
    
    var averageUserRating: Float?
    
    let screenshotUrls: [String]
    
    let artworkUrl100: String // app icon
    
}

//
//  Landmark.swift
//  SwiftUITutorial
//
//  Created by Radomyr Bezghin on 4/15/21.
//
import SwiftUI
import CoreLocation
import Foundation

struct Landmark: Codable, Hashable, Identifiable {
    
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

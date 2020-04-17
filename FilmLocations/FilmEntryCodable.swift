//
//  FilmEntryCodable.swift
//  FilmLocations
//
//  Created by Angelina Olmedo on 4/16/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import Foundation

struct FilmEntryCodable : Codable{
    var firstActor: String
    var locations: String
    var releaseYear: String
    var title: String
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        firstActor = (try container.decodeIfPresent(String.self, forKey: .firstActor)) ?? "Unknown"
        locations = (try container.decodeIfPresent(String.self, forKey: .locations)) ?? "Unknown Location"
        releaseYear = (try container.decodeIfPresent(String.self, forKey: .releaseYear)) ?? "Unknown Year"
        title = (try container.decodeIfPresent(String.self, forKey: .title)) ?? "Unknown Title"
    }
}

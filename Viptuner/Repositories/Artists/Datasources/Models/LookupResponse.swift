//
//  LookupResponse.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/11/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

struct LookupResponse: Codable {
    let resultCount: Int?
    let results: [TrackResponse]?
    
    private enum LookupResponseKeys: String, CodingKey {
        case resultCount, results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: LookupResponseKeys.self)
        self.resultCount = try container.decodeIfPresent(Int.self, forKey: .resultCount)
        self.results = try container.decodeIfPresent([TrackResponse].self, forKey: .results)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: LookupResponseKeys.self)
        try container.encodeIfPresent(resultCount, forKey: .resultCount)
        try container.encodeIfPresent(results, forKey: .results)
    }
}

struct TrackResponse: Codable {
    let wrapperType: String?
    let artistName: String?
    let collectionName: String?
    let trackName: String?
    let previewUrl: String?
    let artworkUrl100: String?
    
    private enum TrackerResponseKeys: String, CodingKey {
        case wrapperType, artistName, collectionName, trackName, previewUrl, artworkUrl100
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TrackerResponseKeys.self)
        self.wrapperType = try container.decodeIfPresent(String.self, forKey: .wrapperType)
        self.artistName = try container.decodeIfPresent(String.self, forKey: .artistName)
        self.collectionName = try container.decodeIfPresent(String.self, forKey: .collectionName)
        self.trackName = try container.decodeIfPresent(String.self, forKey: .trackName)
        self.previewUrl = try container.decodeIfPresent(String.self, forKey: .previewUrl)
        self.artworkUrl100 = try container.decodeIfPresent(String.self, forKey: .artworkUrl100)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: TrackerResponseKeys.self)
        try container.encodeIfPresent(wrapperType, forKey: .wrapperType)
        try container.encodeIfPresent(artistName, forKey: .artistName)
        try container.encodeIfPresent(collectionName, forKey: .collectionName)
        try container.encodeIfPresent(trackName, forKey: .trackName)
        try container.encodeIfPresent(previewUrl, forKey: .previewUrl)
        try container.encodeIfPresent(artworkUrl100, forKey: .artworkUrl100)
    }
}

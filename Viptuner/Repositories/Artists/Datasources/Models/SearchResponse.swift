//
//  SearchResponse.swift
//  Viptuner
//
//  Created by Miguel Zapata on 9/11/19.
//  Copyright © 2019 MZapataE. All rights reserved.
//

struct SearchResponse: Codable {
    let resultCount: Int?
    let results: [ArtistResponse]?

    private enum SearchResponseKeys: String, CodingKey {
        case resultCount, results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SearchResponseKeys.self)
        self.resultCount = try container.decodeIfPresent(Int.self, forKey: .resultCount)
        self.results = try container.decodeIfPresent([ArtistResponse].self, forKey: .results)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: SearchResponseKeys.self)
        try container.encodeIfPresent(resultCount, forKey: .resultCount)
        try container.encodeIfPresent(results, forKey: .results)
    }
}

struct ArtistResponse: Codable {
    let wrapperType: String?
    let artistType: String?
    let artistName: String?
    let artistLinkUrl: String?
    let artistId: Int?
    let amgArtistId: Int?
    let primaryGenreName: String?
    let primaryGenreId: Int?
    
    private enum ArtistResponseKeys: String, CodingKey {
        case wrapperType, artistType, artistName, artistLinkUrl, artistId, amgArtistId, primaryGenreName, primaryGenreId
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArtistResponseKeys.self)
        self.wrapperType = try container.decodeIfPresent(String.self, forKey: .wrapperType)
        self.artistType = try container.decodeIfPresent(String.self, forKey: .artistType)
        self.artistName = try container.decodeIfPresent(String.self, forKey: .artistName)
        self.artistLinkUrl = try container.decodeIfPresent(String.self, forKey: .artistLinkUrl)
        self.artistId = try container.decodeIfPresent(Int.self, forKey: .artistId)
        self.amgArtistId = try container.decodeIfPresent(Int.self, forKey: .amgArtistId)
        self.primaryGenreName = try container.decodeIfPresent(String.self, forKey: .primaryGenreName)
        self.primaryGenreId = try container.decodeIfPresent(Int.self, forKey: .primaryGenreId)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ArtistResponseKeys.self)
        try container.encodeIfPresent(wrapperType, forKey: .wrapperType)
        try container.encodeIfPresent(artistType, forKey: .artistType)
        try container.encodeIfPresent(artistName, forKey: .artistName)
        try container.encodeIfPresent(artistLinkUrl, forKey: .artistLinkUrl)
        try container.encodeIfPresent(artistId, forKey: .artistId)
        try container.encodeIfPresent(amgArtistId, forKey: .amgArtistId)
        try container.encodeIfPresent(primaryGenreName, forKey: .primaryGenreName)
        try container.encodeIfPresent(primaryGenreId, forKey: .primaryGenreId)
    }

}

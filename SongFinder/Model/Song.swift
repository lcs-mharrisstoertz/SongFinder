//
//  Song.swift
//  SongFinder
//
//  Created by Morgan Harris-Stoertz on 2023-04-19.
//

import Foundation

struct Song: Codable{
    
    let trackId: Int
    let artistName: String
    let collectionName: String
    let trackName: String
    let artistViewUrl: String
    let collectionViewUrl: String
    let previewUrl: String
    let artworkUrl100: String
}

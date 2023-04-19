//
//  SearchResult.swift
//  SongFinder
//
//  Created by Morgan Harris-Stoertz on 2023-04-19.
//

import Foundation

struct SearchResult: Codable {
    
    let resultCount: Int
    let results: [Song]
    
}

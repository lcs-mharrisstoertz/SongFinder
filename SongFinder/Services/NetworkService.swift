//
//  NetworkService.swift
//  SongFinder
//
//  Created by Russell Gordon on 2023-04-18.
//

import Foundation

struct NetworkService {
    
    // This loads a list of songs that match the provided search term from the endpoint.
    //
    // "async" means it is an asynchronous function.
    //
    // That means it can be run alongside other functionality
    // in our app. Since this function might take a while to complete
    // this ensures that other parts of our app (like the user interface)
    // won't "freeze up" while this function does it's job.
    static func fetch(resultsFor songName: String) async -> [Song] {
        
        let cleanedUpSongName = songName.lowercased().replacingOccurrences(of: " ", with: "+")
        
        // 1. Attempt to create a URL from the address provided
        let endpoint = "https://itunes.apple.com/search?term=\(cleanedUpSongName)&entity=song&limit=20"
        guard let url = URL(string: endpoint) else {
            print("Invalid address for JSON endpoint.")
            return []
        }
        
        // 2. Fetch the raw data from the URL
        //
        // Network requests can potentially fail (throw errors) so
        // we complete them within a do-catch block to report errors if they
        // occur.
        //
        do {
            
            // Fetch the data
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // 3. Decode the data
            
            // Create a decoder object to do most of the work for us
            let decoder = JSONDecoder()
            
            // Use the decoder object to convert the raw data into an instance of our Swift data type
            let decodedData = try decoder.decode(SearchResult.self, from: data)

            // If we got here, decoding succeeded
            if decodedData.resultCount > 0 {
                return decodedData.results
            } else {
                return []
            }
            
        } catch {
            
            // Show an error that we wrote and understand
            print("Count not retrieve data from endpoint, or could not decode into an instance of a Swift data type.")
            print("----")
            
            // Show the detailed error to help with debugging
            print(error.localizedDescription)
            return []
            
        }
        
    }
    
    
}

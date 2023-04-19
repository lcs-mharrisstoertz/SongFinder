//
//  SearchView.swift
//  SongFinder
//
//  Created by Morgan Harris-Stoertz on 2023-04-19.
//

import SwiftUI

struct SearchView: View {
    
    //MARK: stored properties
    @State var foundSongs: [Song] = []
    
    //MARK: computed properties
    var body: some View {
        List(foundSongs, id: \.trackId) { currentSong in
            
            VStack{
                Text(currentSong.trackName)
                    .bold()
                Text(currentSong.artistName)
                
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

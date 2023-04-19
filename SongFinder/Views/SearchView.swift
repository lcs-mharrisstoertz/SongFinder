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
            
            VStack(alignment: .leading) {
                HStack{
                    Text(currentSong.trackName)
                        .bold()
                    
                    Spacer()
                }
                Text(currentSong.artistName)
                    
            }
            .border(.purple)
        }
        .task{
            foundSongs = await NetworkService.fetch()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

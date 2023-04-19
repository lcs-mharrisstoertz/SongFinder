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
    @State var searchText = ""
    
    //MARK: computed properties
    var body: some View {
        NavigationView{
            List(foundSongs, id: \.trackId) { currentSong in
                
                VStack(alignment: .leading) {
                    HStack{
                        Text(currentSong.trackName)
                            .bold()
                        
                        Spacer()
                    }
                    Text(currentSong.collectionName)
                        .italic()
                    Text(currentSong.artistName)
                        
                }
            }
            .searchable(text: $searchText)
            .onChange(of: searchText) { newSearchText in
                Task{
                    foundSongs = await NetworkService.fetch(resultsFor: newSearchText)
                }
            }
      
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

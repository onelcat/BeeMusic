//
//  ContentView.swift
//  BeeMusic
//
//  Created by flqy on 2020/12/17.
//

import SwiftUI

struct SongListRowView:View  {
    
    var image: String
    
    var name: String
    
    var author: String
    
    var body: some View {
        
        HStack {
            
            Image(image)
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .cornerRadius(25)
            
            VStack(alignment: .leading) {
                Text(author)
                    .font(.title2)
                Text(name)
                    .font(.body)
            }
            
        }
        
    }
    
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: SongContenView()) {
                    SongListRowView(image: "ty", name: "Bloom", author: "戳爷")
                }
            }
        }
        .navigationBarTitle("歌曲列表", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

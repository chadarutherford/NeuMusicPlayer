//
//  SongInfoView.swift
//  NeuMusicPlayer
//
//  Created by Chad Rutherford on 4/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import SwiftUI

class Song: ObservableObject {
	@Published var title: String
	@Published var artist: String
	@Published var duration: TimeInterval
	@Published var coverArt = UIImage.flower
	@Published var currentTime: TimeInterval = 50
	
	init(title: String, artist: String, duration: TimeInterval) {
		self.title = title
		self.artist = artist
		self.duration = duration
	}
}

struct SongInfoView: View {
	
	@ObservedObject var song = Song(title: "Low Life", artist: "Future ft. The Weekend", duration: 120)
	
	var body: some View {
		VStack {
			Text(song.title)
				.font(Font.system(.largeTitle, design: .rounded).weight(.medium))
				.foregroundColor(.button)
			
			Text(song.artist)
				.font(Font.system(.callout))
				.foregroundColor(.button)
			
			SongProgressView(song: song)
				.padding(.top, 40)
		}
	}
}

struct SongInfoView_Previews: PreviewProvider {
	static var previews: some View {
		SongInfoView()
	}
}

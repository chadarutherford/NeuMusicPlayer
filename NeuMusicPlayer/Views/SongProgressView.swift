//
//  SongProgressView.swift
//  NeuMusicPlayer
//
//  Created by Chad Rutherford on 4/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import SwiftUI

struct SongProgressView: View {
	
	@ObservedObject var song: Song
	var trackRadius: CGFloat = 3
	
	var body: some View {
		VStack {
			HStack {
				Text("\(Int(song.currentTime))")
				
				Spacer()
				Text("\(Int(song.duration))")
			}
			.foregroundColor(.button)
			.font(.system(.caption))
			
			ZStack {
				RoundedRectangle(cornerRadius: trackRadius)
					.fill(LinearGradient(gradient: Gradient(stops: [
						Gradient.Stop(color: .gradientTop, location: 0.1),
						Gradient.Stop(color: Color.black.opacity(0.8), location: 0.7)
					]), startPoint: .bottom, endPoint: .top))
					.frame(height: trackRadius * 2)
				
				GeometryReader { geometry in
					HStack {
						RoundedRectangle(cornerRadius: self.trackRadius)
							.fill(LinearGradient(gradient: Gradient(colors: [.trackOrange, .trackYellow]),
												 startPoint: .leading,
												 endPoint: .trailing))
							.frame(width: geometry.size.width * self.percentageCompleteForSong(), height: self.trackRadius * 2)
						Spacer()
					}
				}
				
				GeometryReader{ geometry in
					HStack {
						Circle()
							.fill(RadialGradient(gradient: Gradient(stops: [
								Gradient.Stop(color: .trackYellow, location: 0),
								Gradient.Stop(color: .gradientBottom, location: 0.00001),
								Gradient.Stop(color: .gradientTop, location: 1)
							]), center: .center, startRadius: 6, endRadius: 40))
							.frame(width: 40, height: 40)
							.padding(.leading, geometry.size.width * self.percentageCompleteForSong() - 20)
						Spacer()
					}
				}
			}
		}
		.padding(.horizontal, 10)
	}
	
	func percentageCompleteForSong() -> CGFloat {
		CGFloat(song.currentTime / song.duration)
	}
}

struct SongProgressView_Previews: PreviewProvider {
	static var previews: some View {
		let song = Song(title: "Low Life", artist: "Future ft. The Weekend", duration: 120)
		return SongProgressView(song: song)
	}
}

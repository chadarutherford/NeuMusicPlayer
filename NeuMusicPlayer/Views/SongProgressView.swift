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
	var trackRadius: CGFloat = 4
	
	
	var body: some View {
		VStack(spacing: 0) {
			HStack {
				Text(formattedTime(for: song.currentTime))
				
				Spacer()
				Text(formattedTime(for: song.duration))
			}
			.foregroundColor(.button)
			.font(.system(.caption, design: .monospaced))
			
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
						Spacer(minLength: 0)
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
							.gesture(
								DragGesture()
									.onChanged { value in
										self.song.currentTime = self.time(for: value.location.x, in: geometry.size.width)
								}
						)
						Spacer(minLength: 0)
					}
				}
			}
			.frame(height: 40)
		}
		.padding(.horizontal, 20)
	}
	
	func time(for location: CGFloat, in width: CGFloat) -> TimeInterval {
		let percentage = location / width
		let time = song.duration * TimeInterval(percentage)
		if time <= 0 {
			return 0
		} else if time >= song.duration {
			return song.duration
		}
		return time
	}
	
	func percentageCompleteForSong() -> CGFloat {
		CGFloat(song.currentTime / song.duration)
	}
	
	func formattedTime(for time: TimeInterval) -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = "m:ss"
		formatter.timeZone = TimeZone(secondsFromGMT: 0)
		let date = Date(timeIntervalSinceReferenceDate: time)
		return formatter.string(from: date)
	}
}

struct SongProgressView_Previews: PreviewProvider {
	static var previews: some View {
		let song = Song(title: "Low Life", artist: "Future ft. The Weekend", duration: 120)
		return SongProgressView(song: song)
	}
}

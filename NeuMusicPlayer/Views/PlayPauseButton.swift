//
//  PlayPauseButton.swift
//  NeuMusicPlayer
//
//  Created by Chad Rutherford on 4/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import SwiftUI

struct PlayPauseButton: View {
	
	@State private var isPlaying = false
	
    var body: some View {
		Button(action: {
			self.isPlaying.toggle()
		}) {
			ZStack {
				Circle()
					.fill(LinearGradient(gradient: Gradient(colors: colorsForIsPlaying()), startPoint: .topLeading, endPoint: .bottomTrailing))
				
				Circle()
					.fill(LinearGradient(gradient: Gradient(colors: colorsForIsPlaying()), startPoint: .bottomTrailing, endPoint: .topLeading))
					.padding(2)
				
				Image(systemName: isPlaying ? "pause" : "play.fill")
					.foregroundColor(.white)
					.font(Font.system(.callout).weight(.black))
			}
		}
    }
	
	func colorsForIsPlaying() -> [Color] {
		return isPlaying ? [.pauseLight, .pauseDark] : [.playLight, .playDark]
	}
}

struct PlayPauseButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayPauseButton()
    }
}

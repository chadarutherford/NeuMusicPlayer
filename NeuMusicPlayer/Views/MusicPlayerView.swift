//
//  ContentView.swift
//  NeuMusicPlayer
//
//  Created by Chad Rutherford on 4/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import SwiftUI

struct MusicPlayerView: View {
	var body: some View {
		ZStack {
			LinearGradient(gradient:
				Gradient(colors: [.gradientTop, .gradientBottom]),
						   startPoint: .top,
						   endPoint: .bottom)
				.edgesIgnoringSafeArea(.all)
			
			// Container for every view on top of the gradient
			VStack {
				Button(action: {
					// TODO: - Add back navigation later
				}) {
					Image(systemName: "arrow.left")
						.resizable()
						.aspectRatio(contentMode: .fit)
						.foregroundColor(.button)
						.frame(width: 30, height: 30)
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		MusicPlayerView()
	}
}

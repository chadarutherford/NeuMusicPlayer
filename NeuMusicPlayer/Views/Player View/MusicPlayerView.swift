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
		GeometryReader { geometry in
			ZStack {
				LinearGradient(gradient:
					Gradient(colors: [.gradientTop, .gradientBottom]),
							   startPoint: .top,
							   endPoint: .bottom)
					.edgesIgnoringSafeArea(.all)
				
				// Container for every view on top of the gradient
				VStack {
					HStack {
						BasicButton(imageName: "arrow.left", size: 50, symbolConfig: .navButtonConfig)
							.padding(.leading)
						
						Spacer()
						
						Text("PLAYING NOW")
							.foregroundColor(.button)
							.font(Font.system(.headline).smallCaps())
						
						Spacer()
						
						BasicButton(imageName: "line.horizontal.3", size: 50, symbolConfig: .navButtonConfig)
							.padding(.trailing)
					}
					
					CoverArtView(size: geometry.size.width * 0.8)
						.padding(.top, 20)
						.padding(.bottom, 30)
					
					SongInfoView()
					
					Spacer()
					
					HStack {
						BasicButton(imageName: "backward.end.fill", size: 75, symbolConfig: .playButtonConfig)
							.padding(.trailing)
						
						PlayPauseButton()
							.frame(width: 75, height: 75)
						
						BasicButton(imageName: "forward.end.fill", size: 75, symbolConfig: .playButtonConfig)
							.padding(.leading)
					}
					Spacer()
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

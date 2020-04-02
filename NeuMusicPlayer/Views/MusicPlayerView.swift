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
						BasicButton(imageName: "arrow.left")
							.padding(.leading)
						
						Spacer()
						
						Text("PLAYING NOW")
							.foregroundColor(.button)
							.font(Font.system(.headline).smallCaps())
						
						Spacer()
						
						BasicButton(imageName: "line.horizontal.3")
							.padding(.trailing)
					}
					
					CoverArtView(size: geometry.size.width * 0.8)
						.padding(.top, 20)
						.padding(.bottom, 30)
					
					SongInfoView()
					
					Spacer()
					
					PlayPauseButton()
						.frame(width: 75, height: 75)
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

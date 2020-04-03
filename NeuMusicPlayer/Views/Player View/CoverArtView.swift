//
//  CoverArtView.swift
//  NeuMusicPlayer
//
//  Created by Chad Rutherford on 4/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import SwiftUI

struct CoverArtView: View {
	
	var size: CGFloat = 300
	
    var body: some View {
        ZStack {
			Circle()
				.fill(LinearGradient(gradient: Gradient(colors: [.gradientBottom, .buttonBackground]), startPoint: .bottomTrailing, endPoint: .topLeading))
				.frame(width: size, height: size)
			
			Image(uiImage: .flower)
				.resizable()
				.font(Font.system(.headline).weight(.bold))
				.aspectRatio(contentMode: .fill)
				.foregroundColor(.button)
				.frame(width: size * 0.95, height: size * 0.95)
				.background(LinearGradient(gradient:
					Gradient(colors: [.gradientTop, .gradientBottom]),
										   startPoint: .topLeading,
										   endPoint: .bottomTrailing))
				.clipShape(Circle())
		}
		.shadow(color: Color.black.opacity(0.4), radius: 20, x: 25, y: 25)
		.shadow(color: Color.white.opacity(0.1), radius: 15, x: -15, y: -15)

    }
}

struct CoverArtView_Previews: PreviewProvider {
    static var previews: some View {
        CoverArtView()
    }
}

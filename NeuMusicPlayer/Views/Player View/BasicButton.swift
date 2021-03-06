//
//  BasicButton.swift
//  NeuMusicPlayer
//
//  Created by Chad Rutherford on 4/2/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import SwiftUI

struct BasicButton: View {
	
	
	var imageName: String
	var size: CGFloat
	var symbolConfig: UIImage.SymbolConfiguration
	
    var body: some View {
		Button(action: {
			// TODO: - Add back navigation later
		}) {
			ZStack {
				Circle()
					.fill(LinearGradient(gradient: Gradient(colors: [.gradientBottom, .gradientTop]), startPoint: .bottomTrailing, endPoint: .topLeading))
					.frame(width: size, height: size)
				
				Image(uiImage: UIImage(systemName: imageName, withConfiguration: symbolConfig)!)
					.aspectRatio(contentMode: .fit)
					.foregroundColor(.button)
					.frame(width: size * 0.95, height: size * 0.95)
					.background(LinearGradient(gradient:
						Gradient(colors: [.gradientTop, .gradientBottom]),
											   startPoint: .topLeading,
											   endPoint: .bottomTrailing))
					.clipShape(Circle())
			}
			.shadow(color: Color.black.opacity(0.3), radius: 10, x: 5, y: 5)
			.shadow(color: Color.white.opacity(0.1), radius: 10, x: -5, y: -5)
		}
	}
}

struct BasicButton_Previews: PreviewProvider {
    static var previews: some View {
		BasicButton(imageName: "arrow.left", size: 50, symbolConfig: .navButtonConfig)
    }
}

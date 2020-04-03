//
//  SearchResultRow.swift
//  NeuMusicPlayer
//
//  Created by Chad Rutherford on 4/3/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import SwiftUI

struct SearchResultRow: View {
	
	var searchResult: SearchResult
	@Binding var selectedResult: SearchResult?
	
	var body: some View {
		Button(action: {
			self.selectedResult = self.searchResult
		}) {
			ZStack {
				if searchResult.id == selectedResult?.id {
					RoundedRectangle(cornerRadius: 15)
						.fill(LinearGradient(gradient: Gradient(colors: [.gradientMedium, .gradientBottom]), startPoint: .bottom, endPoint: .top))
						.shadow(color: Color.white.opacity(0.1), radius: 1, x: 0, y: -1)
						.shadow(color: Color.black.opacity(0.4), radius: 1, x: 0, y: 1)
				}
				
				HStack {
					VStack(alignment: .leading) {
						Text(searchResult.mainText)
							.foregroundColor(.button)
							.font(Font.system(.headline).weight(.medium))
						
						if searchResult.subText != nil {
							Text(searchResult.subText!)
								.foregroundColor(.button)
								.font(Font.system(.caption))
						}
					}
					.padding(.leading)
					
					Spacer()
					
					BasicButton(imageName: "play.fill", size: 40, symbolConfig: .searchButtonConfig)
						.padding(.trailing)
				}
			}
		}
		.buttonStyle(SearchRowStyle())
		.frame(height: 60)
	}
}

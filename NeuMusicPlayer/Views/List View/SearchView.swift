//
//  SearchView.swift
//  NeuMusicPlayer
//
//  Created by Chad Rutherford on 4/3/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import SwiftUI

struct SearchView: View {
	
	var searchResults: [SearchResult] = [
		Artist(name: "Weezer", subText: "Unknown"),
		Artist(name: "The Beatles", subText: "Unknown"),
		Artist(name: "Avenged Sevenfold", subText: "Unknown"),
		Artist(name: "Evanescence", subText: "Unknown"),
		Artist(name: "Stone Sour", subText: "Unknown"),
		Artist(name: "Papa Roach", subText: "Unknown"),
		Artist(name: "Fireflight", subText: "Unknown"),
		Artist(name: "5 Finger Death Punch", subText: "Unknown"),
		Artist(name: "Ed Sheeran", subText: "Unknown"),
		Artist(name: "Ariana Grande", subText: "Unknown"),
		Artist(name: "Halsey", subText: "Unknown"),
		Artist(name: "Queen", subText: "Unknown"),
		Artist(name: "Led Zeppelin", subText: "Unknown"),
		Artist(name: "Shinedown", subText: "Unknown"),
		Artist(name: "Daughtry", subText: "Unknown")
	]
	
	@State var selectedResult: SearchResult?
	
	init() {
		UITableView.appearance().backgroundColor = .clear
		UITableViewCell.appearance().backgroundColor = .clear
		UITableView.appearance().showsVerticalScrollIndicator = false
	}
	
	var body: some View {
		ZStack {
			LinearGradient(gradient: Gradient(colors: [.gradientTop, .gradientBottom]), startPoint: .top, endPoint: .bottom)
				.edgesIgnoringSafeArea(.all)
			
			List(searchResults, id: \.id) { searchResult in
				SearchResultRow(searchResult: searchResult, selectedResult: self.$selectedResult)
			}
		}
	}
}

struct SearchView_Previews: PreviewProvider {
	static var previews: some View {
		SearchView()
	}
}


struct SearchRowStyle: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		ZStack {
			RoundedRectangle(cornerRadius: 15)
				.fill(fillForBackground(for: configuration.isPressed))
				.shadow(color: Color.white.opacity(0.1), radius: 1, x: 0, y: -1)
				.shadow(color: Color.black.opacity(0.4), radius: 1, x: 0, y: 1)
			
			configuration.label
		}
	}
	
	func fillForBackground(for isPressed: Bool) -> some ShapeStyle {
		if isPressed {
			return LinearGradient(gradient: Gradient(colors: [.gradientMedium, .gradientBottom]), startPoint: .bottom, endPoint: .top)
		} else {
			return LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0001)]), startPoint: .bottom, endPoint: .top)
		}
	}
}

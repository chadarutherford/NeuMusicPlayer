//
//  Artist.swift
//  NeuMusicPlayer
//
//  Created by Chad Rutherford on 4/3/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import Foundation

struct Artist: SearchResult, Identifiable {
	var id = UUID()
	var name: String
	var mainText: String {
		return name
	}
	
	var subText: String? = nil
}

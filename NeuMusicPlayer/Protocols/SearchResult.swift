//
//  SearchResult.swift
//  NeuMusicPlayer
//
//  Created by Chad Rutherford on 4/3/20.
//  Copyright © 2020 Chad Rutherford. All rights reserved.
//

import Foundation

protocol SearchResult {
	var mainText: String { get }
	var subText: String? { get }
	var id: UUID { get }
}

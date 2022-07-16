//
//  Color.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 15/07/2022.
//

import Foundation
import SwiftUI

extension Color {
	
	init(hex: String) {
		let scanner = Scanner(string: hex)
		scanner.scanLocation = 0
		var rgbValue: UInt64 = 0
		scanner.scanHexInt64(&rgbValue)
		
		let r = (rgbValue & 0xff0000) >> 16
		let g = (rgbValue & 0xff00) >> 8
		let b = rgbValue & 0xff
		
		self.init(
			red: CGFloat(r) / 0xff,
			green: CGFloat(g) / 0xff,
			blue: CGFloat(b) / 0xff
		)
	}
	
	static var test: Self = .white
	static var appBG: LinearGradient { .init(["5936B4","362A84"], startPoint: .topLeading, endPoint: .bottomTrailing) }
}

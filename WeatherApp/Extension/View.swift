//
//  View.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 15/07/2022.
//

import Foundation
import SwiftUI


extension View {
	
	func fullFrame() -> some View { self.frame(width: .totalWidth, height: .totalHeight).edgesIgnoringSafeArea(.all) }
	
	static func spacer(height:CGFloat) -> some View { Spacer().frame(height:height) }
	
	static func spacer(width:CGFloat) -> some View { Spacer().frame(width:width) }
}


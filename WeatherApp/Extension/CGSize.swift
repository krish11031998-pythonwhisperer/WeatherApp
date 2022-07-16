//
//  CGSize.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 15/07/2022.
//

import Foundation
import SwiftUI

extension CGSize {
	
	static var fullScreenSize: CGSize = .init(width: .totalWidth, height: .totalHeight)
	
	static func * (lhs:CGSize,rhs:CGFloat) -> CGSize { .init(width: lhs.width * rhs , height: lhs.height * rhs) }
	
	var half: CGSize { self * 0.5 }
	
	static func squared(_ dim:CGFloat) -> CGSize { .init(width: dim, height: dim) } 
}

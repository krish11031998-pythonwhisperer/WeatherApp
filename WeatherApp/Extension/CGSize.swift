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
	
	static func - (lhs:CGSize,rhs:UIEdgeInsets) -> CGSize {
		.init(width: lhs.width - (rhs.left + rhs.right), height: lhs.height - (rhs.top + rhs.bottom))
	}
	
	static func - (lhs:CGSize,rhs:CGSize) -> CGSize { .init(width: lhs.width - rhs.width, height: lhs.height - rhs.height) }
}

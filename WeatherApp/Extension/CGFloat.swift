//
//  CGFloat.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 15/07/2022.
//

import Foundation
import UIKit
import SwiftUI

extension CGFloat {
	
	static var totalWidth: CGFloat = UIScreen.main.bounds.width
	
	static var totalHeight: CGFloat = UIScreen.main.bounds.height
	
	var half:CGFloat { self * 0.5 }
	
	func normalizeBetween(min:CGFloat,max:CGFloat) -> CGFloat { (self - min) / (max - min) }
	
	func maxClamp(_ value:CGFloat) -> CGFloat { self <= value ? self : value }
	
}

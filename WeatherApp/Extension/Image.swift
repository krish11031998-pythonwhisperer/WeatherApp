//
//  Image.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 17/07/2022.
//

import Foundation
import SwiftUI


extension Image {
	
	func styledImageText(fontSize:CGFloat,weight:Font.Weight,color:Color) -> Text {
		.init(self).styled(fontSize: fontSize, weight: weight, color: color)
	}
	
}

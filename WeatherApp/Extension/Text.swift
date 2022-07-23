//
//  Text.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 16/07/2022.
//

import Foundation
import SwiftUI

extension Text {

	func styled(fontSize:CGFloat,weight:Font.Weight,color:Color) -> Text {
		self.font(.system(size: fontSize)).fontWeight(weight).foregroundColor(color)
	}

}

extension String {
	
	func styled(fontSize:CGFloat,weight:Font.Weight,color:Color) -> Text {
		.init(self).styled(fontSize: fontSize, weight: weight, color: color)
	}
	
	func regularText() -> Text {
		.init(self).fontWeight(.regular).foregroundColor(.white)
	}
	
	func thinText() -> Text {
		.init(self).fontWeight(.thin).foregroundColor(.white)
	}
	
	func boldText() -> Text {
		.init(self).fontWeight(.bold).foregroundColor(.white)
	}
	
	func semiBoldText() -> Text {
		.init(self).fontWeight(.semibold).foregroundColor(.white)
	}
	
	
	func headerText() -> Text {
		regularText().font(.system(size: 34))
	}
	
	func heroText() -> Text {
		thinText().font(.system(size: 96))
	}
	
}

//
//  LinearGradient.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 15/07/2022.
//

import Foundation
import SwiftUI

extension LinearGradient {
	
	init( _ hexColor:[String],startPoint:UnitPoint,endPoint:UnitPoint){
		self.init(colors: hexColor.map(Color.init), startPoint: startPoint, endPoint: endPoint)
	}
	
}

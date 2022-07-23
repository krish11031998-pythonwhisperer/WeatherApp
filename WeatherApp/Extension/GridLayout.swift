//
//  GridLayout.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 17/07/2022.
//

import Foundation
import SwiftUI

extension GridItem {
	
	static func standardTwoByTwo(_ w:CGFloat) -> [GridItem] { [.init(.adaptive(minimum: w * 0.5 - 5, maximum: w * 0.5 - 5), spacing: 10)] }
	
}

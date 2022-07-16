//
//  FancyHeader.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 16/07/2022.
//

import Foundation
import SwiftUI

struct FancyHeader: View {
	
	@Binding var expanded:Bool
	@Namespace var animation
	
	init(expanded:Binding<Bool>){
		self._expanded = expanded
	}
	
	var body: some View{
		VStack(alignment: .center, spacing: 2) {
			"Montreal".headerText()
			if !expanded {
				"19°".heroText()
					.minimumScaleFactor(0.1)
					.matchedGeometryEffect(id: "temp", in: animation)
					
			}
			VStack {
				HStack(alignment: .center, spacing: 5) {
					if expanded {
						"19°".styled(fontSize: 20, weight: .bold, color: .gray)
							.matchedGeometryEffect(id: "temp", in: animation)
					}
					"\(expanded ? "|" : "") Mostly Clear".styled(fontSize: 20, weight: .bold, color: .gray)
				}
				if !expanded {
					HStack(alignment: .center, spacing: 12) {
						"H:24°".styled(fontSize: 20, weight: .regular, color: .white)
						"L:18°".styled(fontSize: 20, weight: .regular, color: .white)
					}
				}
			}
		}.frame(width: .totalWidth,alignment: .center)
	}
	
}

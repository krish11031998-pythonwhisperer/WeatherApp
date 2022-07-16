//
//  SheetView.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 16/07/2022.
//

import Foundation
import SwiftUI

struct SheetView<T:View>: View {
	
	@Binding var expanded:Bool
	@Binding var y_off:CGFloat
	let minHeight:CGFloat = .totalHeight * 0.35
	let maxHeight:CGFloat
	let innerView:T
	var containerHeight: CGFloat {
		(minHeight - y_off).maxClamp(maxHeight)
	}
	
	init(
		expanded:Binding<Bool>,
		y_off:Binding<CGFloat>,
		maxHeight:CGFloat,
		@ViewBuilder innerView: () -> T
	) {
		self._expanded = expanded
		self._y_off = y_off
		self.maxHeight = maxHeight
		self.innerView = innerView()
	}
	
	var body: some View {
		VStack(alignment: .center, spacing: 10) {
			RoundedRectangle(cornerRadius: 10)
				.background(Color.black)
				.frame(width: 50, height: 5)
				.padding(.top,8)
			innerView
			Spacer()
		}
		.frame(width: .totalWidth, height: containerHeight)
		.background(Color.appBG.opacity(0.75))
		.clipShape(RoundedRectangle(cornerRadius: 20))
		
		
	}
	
}

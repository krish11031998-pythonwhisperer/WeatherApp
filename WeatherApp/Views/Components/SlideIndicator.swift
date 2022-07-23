//
//  SlideIndicator.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 17/07/2022.
//

import Foundation
import SwiftUI

struct SlideIndicator: View {
	
	var viewFrame:CGSize
	var value:Float
	var gradient:LinearGradient
	init(
		viewFrame:CGSize = .init(width: .totalWidth - 20, height: 15),
		value:Float,
		gradientColor:LinearGradient = .init(["3658B1","C159EC"], startPoint: .leading, endPoint: .trailing)
	) {
		self.viewFrame = viewFrame
		self.gradient = gradientColor
		self.value = value
	}
	
	
	var linerGradView:some View {
		Capsule()
			.fill(gradient)
			.frame(size: viewFrame)
	}
	
	var indicatorView:some View {
		var x_off = CGFloat(value) * viewFrame.width
		x_off += (value == 0 ? 1 : value == 1 ? -1 : 0) * viewFrame.height.half
		return Circle()
			.fill(Color.white)
			.frame(size: .squared(viewFrame.height))
			.position(x: x_off, y: viewFrame.height.half)
	}
	
	var body: some View{
		ZStack(alignment: .center) {
			linerGradView
			indicatorView
		}.frame(size: viewFrame)
		
	}
	
}

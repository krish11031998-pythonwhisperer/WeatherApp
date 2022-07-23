//
//  View.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 15/07/2022.
//

import Foundation
import SwiftUI


extension View {
	
	func fullFrame() -> some View { self.frame(width: .totalWidth, height: .totalHeight).edgesIgnoringSafeArea(.all) }
	
	static func spacer(height:CGFloat) -> some View { Spacer().frame(height:height) }
	
	static func spacer(width:CGFloat) -> some View { Spacer().frame(width:width) }
	
	@ViewBuilder func frame(size:CGSize?) -> some View {
		if let safeSize = size {
			if !safeSize.width.isZeroOrInfinite && !safeSize.height.isZeroOrInfinite {
				self.frame(width: safeSize.width, height: safeSize.height)
			} else if !safeSize.width.isZeroOrInfinite {
				self.frame(width: safeSize.width)
			} else if !safeSize.height.isZeroOrInfinite {
				self.frame(height: safeSize.height)
			} else {
				self
			}
		} else {
			self
		}
	}
	
	@ViewBuilder func insetHPadding(currIdx:Int,maxIdx:Int,_ val:CGFloat) -> some View {
		if currIdx == .zero {
			padding(.leading,val)
		} else if currIdx == maxIdx {
			padding(.trailing,val)
		} else {
			self
		}
	}
	
	@ViewBuilder func insetVPadding(currIdx:Int,maxIdx:Int,_ val:CGFloat) -> some View {
		if currIdx == .zero {
			padding(.top,val)
		} else if currIdx == maxIdx {
			padding(.bottom,val)
		} else {
			self
		}
	}
	
	func roundedBorder(color:Color,lineWidth:CGFloat = 2, radius:CGFloat) -> some View {
		overlay(
			RoundedRectangle(cornerRadius: radius)
				.stroke(color,lineWidth: lineWidth)
		)
	}
	
	func card() -> some View {
		background(Color.componentBG)
		.cornerRadius(12)
		.roundedBorder(color: .white ,lineWidth: 0.6, radius: 12)
	}

}

struct HScrollView<T:View>: View {
	
	var data: [Any]
	@ViewBuilder var innerView: (Any) -> T
	var spacing: CGFloat
	var inset:CGFloat
	
	init(data:[Any],spacing:CGFloat,inset:CGFloat = 20,@ViewBuilder innerView: @escaping (Any) -> T) {
		self.data = data
		self.innerView = innerView
		self.spacing = spacing
		self.inset = inset
	}
	
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(alignment: .center, spacing: spacing) {
				ForEach(Array(data.enumerated()), id:\.offset) { dataEl in
					innerView(dataEl.element).insetHPadding(currIdx: dataEl.offset, maxIdx: data.count - 1, inset)
				}
			}
		}
	}
	
}


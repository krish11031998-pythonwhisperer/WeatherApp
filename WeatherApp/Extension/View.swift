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
			self.frame(width: safeSize.width, height: safeSize.height)
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


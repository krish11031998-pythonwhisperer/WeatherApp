//
//  ImageMOdifier.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 15/07/2022.
//

import Foundation
import SwiftUI

struct BackgroundView:ViewModifier {

	var img: Image

	init(name:String) {
		self.img = .init(name)
	}
	
	init(image:UIImage){
		self.img = .init(uiImage: image)
	}
	
	func body(content: Content) -> some View {
		return content
			.background(img.resizable())
			.clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
	}
	
}

extension View {

	@ViewBuilder func backgroundImageView(name:String? = nil,image:UIImage? = nil) -> some View {
		if let safeName = name {
			modifier(BackgroundView(name: safeName))
		}else if let safeImage = image {
			modifier(BackgroundView(image: safeImage))
		} else {
			self
		}
	}
	
}

//
//  WeatherDetailCard.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 17/07/2022.
//

import Foundation
import SwiftUI


struct WeatherDetailCard<T:View>: View {
	
	var systemImageName:String
	var titleName:String
	var innerView:(CGSize) -> T
	var size:CGSize
	var padding:CGFloat
	var spacing:CGFloat
	
	init(
		systemName:String,
		titleName:String,
		size:CGSize,
		padding:CGFloat = 16,
		spacing:CGFloat = 15,
		@ViewBuilder innerView: @escaping (CGSize) -> T
	) {
		self.systemImageName = systemName
		self.titleName = titleName
		self.size = size
		self.padding = padding
		self.spacing = spacing
		self.innerView = innerView
	}
	
	var headerView: Text {
		let imageText = Image(systemName: systemImageName).styledImageText(fontSize: 12, weight: .semibold, color: .gray)
		let titleText = (" " + titleName).uppercased().styled(fontSize: 12, weight: .semibold, color: .gray)
		let header:Text =  imageText + titleText
		return header
	}
	
	var body: some View {
		Container.VContainer(size: size, padding:padding, spacing: spacing, alignment: .leading) { innerSize in
			headerView
			innerView(innerSize)
		}.card()
	}
	
}

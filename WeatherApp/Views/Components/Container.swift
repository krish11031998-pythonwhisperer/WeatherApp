//
//  Container.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 17/07/2022.
//

import Foundation
import SwiftUI


struct Container<T:View>:View {
	
	var innerViewWithWidth:((CGFloat) -> T)? = nil
	var innerViewWithSize:((CGSize) -> T)? = nil
	var padding:CGFloat
	var alignment: Alignment
	var axis:Axis
	var size:CGSize?
	var containerWidth:CGFloat?
	var spacing:CGFloat
	
	init(
		size:CGSize,
		axis:Axis = .vertical,
		padding:CGFloat = 15,
		spacing:CGFloat = 10,
		alignment: Alignment = .center,
		@ViewBuilder innerViewWithSize: @escaping (CGSize) -> T
	) {
		self.size = size
		self.padding = padding
		self.alignment = alignment
		self.axis = axis
		self.spacing = spacing
		self.innerViewWithSize = innerViewWithSize
	}
	
	init(
		width containerWidth:CGFloat,
		axis:Axis = .vertical,
		padding:CGFloat = 15,
		spacing:CGFloat = 10,
		alignment: Alignment = .center,
		@ViewBuilder innerViewWithWidth: @escaping (CGFloat) -> T
	) {
		self.containerWidth = containerWidth
		self.padding = padding
		self.alignment = alignment
		self.axis = axis
		self.spacing = spacing
		self.innerViewWithWidth = innerViewWithWidth
	}
	
	var width: CGFloat { containerWidth ?? size?.width ?? .zero }
	var innerWidth: CGFloat { (containerWidth ?? size?.width ?? .zero) - (2 * (padding + 2)) }
	var innerHeight: CGFloat { (size?.height ?? .zero) - (2 * (padding + 2))  }
	var innerSize:CGSize {
		guard let size = size else { return .init(width: width,height: .infinity) }
		return size - CGSize.squared(2*padding)
	}
	
	@ViewBuilder func innerViewBuilder() -> some View {
		if let safeInnerViewWithSize = innerViewWithSize {
			safeInnerViewWithSize(innerSize - .squared(4))
		} else if let safeInnerViewWithWidth = innerViewWithWidth {
			safeInnerViewWithWidth(innerWidth)
		} else {
			Color.clear
		}
	}
	
	@ViewBuilder var mainBody: some View {
		switch axis {
			case .vertical:
				VStack(alignment: alignment.horizontal, spacing: spacing) {
					innerViewBuilder().frame(width: innerWidth,alignment: .leading)
				}
				
			case .horizontal:
				HStack(alignment: alignment.vertical, spacing: spacing) {
					innerViewBuilder().frame(height: innerHeight,alignment: .center )
				}
				
		}
	}
	
	var body: some View{
		ZStack(alignment: .center) {
			mainBody
				.padding(2)
				.frame(size: innerSize)
				.clipped()
		}
		.padding(.all,padding)
		.frame(width:width)
		
	}
}

extension Container {
	
	//MARK: - Horizontal Container
	
	static func HContainer(
		size:CGSize,
		padding:CGFloat = 15,
		spacing:CGFloat = 10,
		alignment: Alignment = .center,
		@ViewBuilder innerView: @escaping (CGSize) -> T
	) -> Container {
		Container(size:size, axis: .horizontal, padding: padding, spacing: spacing, alignment: alignment, innerViewWithSize: innerView)
	}
	
	//MARK: - Vertical Container
	
	static func VContainer(
		size:CGSize,
		padding:CGFloat = 15,
		spacing:CGFloat = 10,
		alignment: Alignment = .center,
		@ViewBuilder innerView: @escaping (CGSize) -> T
	) -> Container {
		Container(size:size, axis: .vertical, padding: padding, spacing: spacing, alignment: alignment, innerViewWithSize: innerView)
	}
	
	//MARK: - Width
	static func HContainer(
		width:CGFloat,
		padding:CGFloat = 15,
		spacing:CGFloat = 10,
		alignment: Alignment = .center,
		@ViewBuilder innerView: @escaping (CGFloat) -> T
	) -> Container {
		Container(width: width, axis: .horizontal, padding: padding, spacing: spacing, alignment: alignment, innerViewWithWidth: innerView)
	}
	
	//MARK: - Vertical Container
	
	static func VContainer(
		width:CGFloat,
		padding:CGFloat = 15,
		spacing:CGFloat = 10,
		alignment: Alignment = .center,
		@ViewBuilder innerView: @escaping (CGFloat) -> T
	) -> Container {
		Container(width: width, axis: .vertical, padding: padding, spacing: spacing, alignment: alignment, innerViewWithWidth: innerView)
	}
}

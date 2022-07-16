//
//  MainView.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 16/07/2022.
//

import Foundation
import SwiftUI


struct MainViewWrapper<T:View>: ViewModifier {
	
	var bgView:T?
	
	init (bgView:(() -> T)? = nil) {
		self.bgView = bgView?()
	}
	
	func body(content: Content) -> some View {
		ZStack(alignment: .top) {
			if let safeBG = bgView {
				safeBG
			}else{
				Color.appBG
			}
			content
		}.fullFrame()
	}
}

struct SafeAreaPadding:ViewModifier {
	
	var spacing:CGFloat
	var edge:Any
	
	init(spacing:CGFloat,edge:VerticalEdge) {
		self.spacing = spacing
		self.edge = edge
	}
	
	init(spacing:CGFloat,edge:HorizontalEdge) {
		self.spacing = spacing
		self.edge = edge
	}
	
	@ViewBuilder func body(content: Content) -> some View {
		if let verticalEdge = edge as? VerticalEdge {
			content
				.safeAreaInset(edge: verticalEdge) { Spacer().frame(height: spacing) }
		}else if let horizontalEdge = edge as? HorizontalEdge {
			content
				.safeAreaInset(edge: horizontalEdge) { Spacer().frame(height: spacing) }
		}else {
			content
		}
	}
	
}

extension View {
	
	func mainViewBackground<T:View>( _ bgView: (() -> T)? = nil) -> some View{
		modifier(MainViewWrapper(bgView: bgView))
	}
	
	func safeAreaPadding(spacing:CGFloat, edge:VerticalEdge) -> some View {
		modifier(SafeAreaPadding(spacing: spacing, edge: edge))
	}
	
	func safeAreaPadding(spacing:CGFloat, edge:HorizontalEdge) -> some View {
		modifier(SafeAreaPadding(spacing: spacing, edge: edge))
	}

}

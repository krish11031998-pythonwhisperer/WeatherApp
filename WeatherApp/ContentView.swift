//
//  ContentView.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 15/07/2022.
//

import SwiftUI

struct ContentView: View {
	
	@State var y_off: CGFloat = .zero
	@State var expanded: Bool = false {
		didSet { y_off =  expanded ? -.totalHeight : .zero }
	}
	
	var y_off_target:CGFloat { !expanded ? .zero :  -.totalHeight }
	
	@Namespace var animation
	
	var headerView:some View {
		FancyHeader(expanded: $expanded)
		.safeAreaPadding(spacing: 98, edge: .top)
	}
	
	var body: some View {
		ZStack(alignment: .top) {
			Color.appBG
			ZStack(alignment: .center) {
				ImageView(name: "Background",scale: .fill)
				ImageView(name: "House", scale: .fit,size:.init(width: .totalWidth, height: 390))
					.position(x: .totalWidth * 0.5, y: .totalHeight * 0.36 + 195)
			}.offset(x: .zero, y: y_off)
			
			headerView
		}
		.fullFrame()
		.gesture(DragGesture().onChanged(onChange(_:)).onEnded(onEnded(_:)))
	}
	
	private func onChange(_ gesture:DragGesture.Value) {
		withAnimation(.easeInOut) {
			if y_off_target + gesture.translation.height <= 0 {
				y_off = y_off_target + gesture.translation.height
			}
		}
		
	}
	
	private func onEnded( _ gesture:DragGesture.Value){
		withAnimation(.easeInOut) {
			if !expanded {
				if .totalHeight + gesture.translation.height <= .totalHeight * 0.45 {
					expanded.toggle()
				} else {
					y_off = y_off_target
				}
			} else {
				if y_off + gesture.translation.height >= .totalHeight * -0.35 {
					expanded.toggle()
				} else {
					y_off = y_off_target
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

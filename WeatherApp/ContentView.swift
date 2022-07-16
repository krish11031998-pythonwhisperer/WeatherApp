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
		.safeAreaPadding(spacing: 98, edge: .top)
	}
	
	var body: some View {
		ZStack(alignment: .top) {
			Color.appBG
			ImageView(name: "Background",scale: .fill)
				.offset(x: .zero, y: y_off)
			ImageView(name: "House", scale: .fit)
				.frame(width: .totalWidth, height: 390)
				.safeAreaPadding(spacing: .totalHeight * 0.5 - 150, edge: .top)
				.offset(x: .zero, y: y_off)
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

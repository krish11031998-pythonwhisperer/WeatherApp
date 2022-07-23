//
//  ContentView.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 15/07/2022.
//

import SwiftUI

class DrawerState: ObservableObject {
	@Published var y_off: CGFloat = .zero
	@Published var expanded: Bool = false { didSet { y_off =  expanded ? -.totalHeight : .zero } }
}

struct ContentView: View {
	
	@StateObject var drawerState:DrawerState = .init()
	var expanded: Bool { drawerState.expanded }
	var y_off: CGFloat { drawerState.y_off }
	
	var headerHeight: CGFloat { !expanded ? 183 : 78 }
	var headerViewPadding: CGFloat { expanded ? 48 : 98 }
	var sheetMaxHeight: CGFloat { .totalHeight - (headerHeight + headerViewPadding + 12) }
	
	@Namespace var animation
	
	var headerView:some View {
		VStack{
			FancyHeader(expanded: $drawerState.expanded)
				.frame(width: .totalWidth, height:headerHeight)
			Spacer()
		}.safeAreaPadding(spacing: headerViewPadding, edge: .top)
	}
	
	var bgView: some View {
		ZStack(alignment: .center) {
			ImageView(name: "Background",scale: .fill)
			ImageView(name: "House", scale: .fit,size:.init(width: .totalWidth, height: 390))
				.position(x: .totalWidth * 0.5, y: .totalHeight * 0.36 + 195)
		}.offset(x: .zero, y: y_off)
	}
	
	@ViewBuilder func sheetInnerView() -> some View{
		ScrollView(.vertical, showsIndicators: false) {
			DayView()
			WeatherDetailView()
		}
	}
	
	var body: some View {
		ZStack(alignment: .bottom) {
			Color.appBG
			bgView
			headerView
			SheetView(drawerState: drawerState,maxHeight: sheetMaxHeight,innerView: sheetInnerView)
		}
		.fullFrame()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

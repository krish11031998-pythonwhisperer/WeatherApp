//
//  SheetView.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 16/07/2022.
//

import Foundation
import SwiftUI

struct SheetView<T:View>: View {
	@ObservedObject var drawerState:DrawerState
	let minHeight:CGFloat = .totalHeight * 0.35
	let maxHeight:CGFloat
	let innerView:T
	
	var expanded: Bool { drawerState.expanded }
	
	var y_off: CGFloat { drawerState.y_off }
	
	var y_off_target: CGFloat { drawerState.expanded ? -.totalHeight : .zero }
	var containerHeight: CGFloat { (minHeight - drawerState.y_off).maxClamp(maxHeight) }
	
	init(
		drawerState:DrawerState,
		maxHeight:CGFloat,
		@ViewBuilder innerView: () -> T
	) {
		self.drawerState = drawerState
		self.maxHeight = maxHeight
		self.innerView = innerView()
	}
	
	var draggingBar:some View {
		ZStack(alignment: .top) {
			Color.clear
			RoundedRectangle(cornerRadius: 10)
				.background(Color.black)
				.frame(width: 50, height: 5)
		}
		.frame(width: .totalWidth, height: 5)
		.padding(.top,8)
		.gesture(DragGesture().onChanged(onChange(_:)).onEnded(onEnded(_:)))
	}
	
	var body: some View {
		VStack(alignment: .center, spacing: 10) {
			draggingBar
			innerView
		}
		.frame(width: .totalWidth, height: containerHeight)
		.background(Color.appBG.opacity(0.75))
		.clipShape(RoundedRectangle(cornerRadius: 20))
		
		
	}
	
	
	private func onChange(_ gesture:DragGesture.Value) {
		withAnimation(.easeInOut) {
			if y_off_target + gesture.translation.height <= 0 {
				drawerState.y_off = y_off_target + gesture.translation.height
				if !expanded && .totalHeight + gesture.translation.height <= .totalHeight * 0.55 {
					drawerState.expanded.toggle()
				}
			}
		}
		
	}
	
	private func onEnded( _ gesture:DragGesture.Value){
		withAnimation(.easeInOut) {
			if !expanded {
				if .totalHeight + gesture.translation.height <= .totalHeight * 0.75 {
					drawerState.expanded.toggle()
				} else {
					drawerState.y_off = y_off_target
				}
			} else {
				if y_off + gesture.translation.height >= .totalHeight * -0.35 {
					drawerState.expanded.toggle()
				} else {
					drawerState.y_off = y_off_target
				}
			}
		}
	}
}

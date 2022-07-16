//
//  DaysView.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 16/07/2022.
//

import Foundation
import SwiftUI

enum WeatherImage: String {
	case tornado = "Tornado"
	case moon_mid_rain = "Moon cloud mid rain"
	case moon_fast_wind = "Moon cloud fast wind"
	case sun_cloud_rain = "Sun cloud angled rain"
	case sun_cloud_mid_rain = "Sun cloud mid rain"
}

struct WeatherForcastData {
	var time:String
	var imgName:String
	var temp:Int
}

struct DayWeatherViewModel {
	
	var hourlyForcast: [WeatherForcastData] {
		var result: [WeatherForcastData] = []
		let img:[WeatherImage] = [.moon_fast_wind,.moon_mid_rain,.sun_cloud_rain,.sun_cloud_mid_rain,.tornado]
		for time in 1...24 {
			result.append(.init(time: "\(time > 12 ? "\(time - 12)PM" : "\(time)AM")", imgName: img.randomElement()?.rawValue ?? "", temp: Int.random(in: 19...23)))
		}
		return result
	}
	
}

struct DayView: View {
	
	var viewModel: DayWeatherViewModel = .init()
	
	func weatherView(_ weather:WeatherForcastData) -> some View {
		VStack(alignment: .center, spacing: 12) {
			weather.time.regularText().lineLimit(1)
			Spacer()
			ImageView(name: weather.imgName, scale: .fit,size: .squared(32))
			Spacer()
			"\(weather.temp)°".thinText()
		}
		.padding(.vertical,16)
		.padding(.horizontal,8)
		.frame(width: 60, height: 160, alignment: .center)
		.background(Color.appBG)
		.clipShape(Capsule())
	}
	
	var body: some View{
		ScrollView(.vertical, showsIndicators: false) {
			HScrollView(data: viewModel.hourlyForcast, spacing: 10, innerView: { weatherView($0 as! WeatherForcastData)})
		}
	}
	
}

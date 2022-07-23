//
//  WeatherDetailData.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 17/07/2022.
//

import Foundation
import SwiftUI

struct WeatherDetail {
	var airQuality:Int
	var uvIndex:Int
	var sunrise:String
	var wind:Float
	var rainFall:Float
	var feelsLike:Int
	var humidity:Int
	var visibility:Int
	var pressure:Int
	
	static var test: WeatherDetail {
		.init(
			airQuality: .random(in: 1...10),
			uvIndex: .random(in: 1...10),
			sunrise: "5:28",
			wind: .random(in: 1...20),
			rainFall: .random(in: 1...20),
			feelsLike: .random(in: 20...50),
			humidity: .random(in: 20...50),
			visibility:  .random(in: 1...10),
			pressure:  .random(in: 1...10))
	}
}

struct WeatherDetailViewModel {
	
	var data:WeatherDetail
	
	var airQualityDescription: AttributedString {
		var result:AttributedString = ""
		if data.airQuality < 4 {
			result = " - Low Health Risk"
		} else if data.airQuality >= 4 && data.airQuality < 7 {
			result = " - Medium Health Risk"
		} else {
			result = " - High Health Risk"
		}
		result.font = .system(size: 20, weight: .medium, design: .default)
		result.foregroundColor = .white
		return result
	}
	
	func airQualityView(_ w:CGFloat) -> some View {
		var attributedText = AttributedString("\(data.airQuality)")
		attributedText.font = .system(size: 20, weight: .regular, design: .default)
		attributedText.foregroundColor = .white
		attributedText += airQualityDescription
		let size:CGSize = .init(width: w, height: 158)
		
		return WeatherDetailCard(systemName: "aqi.medium", titleName: "air quality", size: size) { size in
			Text(attributedText)
			SlideIndicator(viewFrame: .init(width: size.width, height:5), value: Float(data.airQuality)/10)
			Rectangle()
				.fill(Color.white.opacity(0.25))
				.frame(width: size.width, height: 1.5, alignment: .leading)
			"See More".styled(fontSize: 12, weight: .regular, color: .white)
		}
		
	}
	
}

struct WeatherDetailView: View {
	
	var viewModel:WeatherDetailViewModel
	
	init(weatherData:WeatherDetail = .test) {
		self.viewModel = .init(data: weatherData)
	}
	
	var body: some View {
		Container.VContainer(width: .totalWidth, spacing: 10, alignment: .center) { w in
			viewModel.airQualityView(w)
			LazyVGrid(columns: GridItem.standardTwoByTwo(w), alignment: .center, spacing: 10) {
				ForEach(Array(1...10), id:\.self) { val in
					WeatherDetailCard(
						systemName: "aqi.medium",
						titleName: "Number \(val)",
						size: .init(width: w * 0.5 - 5, height: 100),
						padding: 10,
						spacing: 10
					) { size in
						"\(val)"
							.styled(fontSize: 25, weight: .semibold, color: .white)
						Spacer()
					}
				}
			}
		}
	}
	
}

struct WeatherDetailViewProvider:PreviewProvider {
	
	static var previews: some View{
		WeatherDetailView()
			.background(Color.black)
	}
}



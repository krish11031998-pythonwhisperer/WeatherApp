//
//  Error.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 16/07/2022.
//

import Foundation

enum ImageError:String,Error {
	case invalidURL = "URL provided is invalid"
	case noImage = "Could unwrap the data as a UIImage"
}

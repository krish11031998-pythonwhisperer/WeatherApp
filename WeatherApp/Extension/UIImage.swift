//
//  UIImage.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 16/07/2022.
//

import Foundation
import UIKit


extension UIImage {
	
	static var cachedImage:[String:UIImage] = [:]
	
	static func loadImage(url:String,completion: @escaping (Result<UIImage,Error>) -> Void) {
		if let safeImage = Self.cachedImage[url] {
			completion(.success(safeImage))
		}else {
			guard let safeURL = URL(string: url) else {
				completion(.failure(ImageError.invalidURL))
				return
			}
			let dataTaskSession = URLSession.shared.dataTask(with: safeURL) { data, resp, err in
				guard let safeData = data else {
					guard let err = err else { return }
					completion(.failure(err))
					return
				}
				
				guard let img = UIImage(data: safeData) else {
					completion(.failure(ImageError.noImage))
					return
				}
				
				completion(.success(img))
				
			}
			dataTaskSession.resume()
		}
	}
	
}

//
//  ImageView.swift
//  WeatherApp
//
//  Created by Krishna Venkatramani on 16/07/2022.
//

import Foundation
import SwiftUI

struct ImageView: View {
	
	enum ImageScale {
		case fit
		case fill
	}
	
	var name:String? {
		didSet {
			guard let safeName = name else { return }
			image = .init(safeName)
		}
	}
	
	var url:String? {
		didSet {
			loadImageFromURL()
		}
	}
	
	var scale:ImageScale
	
	@State var image:Image?
	
	init(name:String? = nil,scale:ImageScale = .fit) {
		self.scale = scale
		self.name = name
		guard let name = name else { return }
		self._image = .init(initialValue: .init(name))
	}
	
	init(url:String? = nil,scale:ImageScale = .fit) {
		self.url = url
		self.scale = scale
		loadImageFromURL()
	}
	
	var body: some View {
		if let safeImage = image {
			switch scale {
			case .fit:
				safeImage
					.resizable()
					.scaledToFit()
			case .fill:
				safeImage
					.resizable()
					.scaledToFill()
			}
		}
	}
	
	private func loadImageFromURL() {
		guard let safeURL = url else { return }
		UIImage.loadImage(url: safeURL) { result in
			switch result {
				case .success(let img):
					DispatchQueue.main.async {
						self.image = .init(uiImage: img)
					}
				case .failure(let err):
					print("(DEBUG) Got an error while fetching the Image : ",err.localizedDescription)
			}
		}
	}
}

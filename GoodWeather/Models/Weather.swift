//
//  Weather.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/12/21.
//

import Foundation

struct WeatherResp: Decodable {
    var main: Weather
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}

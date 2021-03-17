//
//  WeatherService.swift
//  GoodWeather
//
//  Created by Jacob LeCoq on 3/12/21.
//

import Foundation

class WeatherService {
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&units=imperial&appid=80bfc380493c28d43427b365a176cf96") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in

            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResp.self, from: data)
            
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
    }
}

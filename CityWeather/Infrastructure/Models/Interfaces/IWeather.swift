//
//  ICity.swift
//  CityWeather
//
//  Created by Bruno Bulić on 16/09/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

import Foundation

@objc protocol IWeather: NSObjectProtocol {
    var date: NSDate {get set}
    var iconName: String {get set }
    var temperatureCelsius: String {get set}
    var forecast: String {get set }
}


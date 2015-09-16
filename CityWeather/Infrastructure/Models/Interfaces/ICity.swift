//
//  ICity.swift
//  CityWeather
//
//  Created by Bruno Bulić on 16/09/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

import Foundation

@objc protocol ICity: NSObjectProtocol {
    var name: String {get}
    var state: String {get}
    var country: String {get}
}


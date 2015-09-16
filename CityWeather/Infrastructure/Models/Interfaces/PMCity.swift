//
//  PMCity.swift
//  CityWeather
//
//  Created by Bruno Bulić on 16/09/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

import Foundation

@objc class PMCity : PMDomainEntity, ICity {
    private let _name: String
    private let _state: String
    private let _country: String
    
    var name: String {
        get {
            return _name
        }
    }
    
    var state: String {
        get {
            return _state
        }
    }
    
    var country: String {
        get {
            return _country
        }
    }
    
    override init(dictionary: [NSObject: AnyObject]) {
        _name = dictionary["name"] as! String
        _state = dictionary["state"] as! String
        _country = dictionary["country"] as! String
        
        super.init(dictionary: dictionary)
    }
    
    init(name: String, state: String, country: String) {
        _name = name
        _state = state
        _country = country
        
        super.init(dictionary: [NSObject: AnyObject]())
    }
}
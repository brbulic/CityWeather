//
//  PMWorldWeatherCityQuery.m
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "PMWorldWeatherCityQuery.h"

@implementation PMWorldWeatherCityQuery

- (instancetype)initFromJSONDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {

        self.name = dictionary[@"areaName"][0][@"value"];
        self.country = dictionary[@"country"][0][@"value"];
        self.state = dictionary[@"region"][0][@"value"];
    }

    return self;
}

@end

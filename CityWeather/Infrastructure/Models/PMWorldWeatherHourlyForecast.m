//
//  PMWorldWeatherHourlyForecast.m
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "PMWorldWeatherHourlyForecast.h"

@implementation PMWorldWeatherHourlyForecast

- (instancetype)initFromJsonDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.temperatureCelsius = dict[@"tempC"];
        self.forecast = dict[@"weatherDesc"][0][@"value"];
        self.iconName =dict[@"weatherIconUrl"][0][@"value"];
    }
    return self;
}

@end

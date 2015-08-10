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
        // UBER api design :S
        self.temperatureCelsius = dict[@"tempC"];
        
        if (!self.temperatureCelsius) {
            self.temperatureCelsius = dict[@"temp_C"];
        }
        self.forecast = dict[@"weatherDesc"][0][@"value"];
        self.iconName = dict[@"weatherIconUrl"][0][@"value"];
    }
    return self;
}

@end

//
//  PMWorldWeatherHourlyForecast.m
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "PMWorldWeatherHourlyForecast.h"

@implementation PMWorldWeatherHourlyForecast

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    if (self) {
        // UBER api design :S
        self.temperatureCelsius = dictionary[@"tempC"];
        
        if (!self.temperatureCelsius) {
            self.temperatureCelsius = dictionary[@"temp_C"];
        }
        self.forecast = dictionary[@"weatherDesc"][0][@"value"];
        self.iconName = dictionary[@"weatherIconUrl"][0][@"value"];
    }
    return self;
}

@end

//
//  PMWorldWeatherDayInfo.m
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "PMWorldWeatherWeatherInfo.h"
#import "PMWorldWeatherHourlyForecast.h"
#import "PMWorldWeatherDailyForecast.h"
#import <PMPracticFunction/PMPracticFunction.h>

@implementation PMWorldWeatherWeatherInfo

- (instancetype)initFromJsonDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.date = [NSDate date];
        self.currentInfo = [[PMWorldWeatherHourlyForecast alloc] initFromJsonDictionary:dict[@"current_condition"][0]];
    
        self.dailyForecast = [dict[@"weather"] map:^id(NSDictionary * weatherInfo) {
            return [[PMWorldWeatherDailyForecast alloc] initFromJsonDictionary:weatherInfo];
        }];
    }
    return self;
}

@end

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

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super initWithDictionary:dictionary];
    if (self) {
        self.date = [NSDate date];
        self.currentInfo = [[PMWorldWeatherHourlyForecast alloc] initWithDictionary:dictionary[@"current_condition"][0]];
    
        self.dailyForecast = [dictionary[@"weather"] map:^id(NSDictionary * weatherInfo) {
            return [[PMWorldWeatherDailyForecast alloc] initWithDictionary:weatherInfo];
        }];
    }
    return self;
}

@end

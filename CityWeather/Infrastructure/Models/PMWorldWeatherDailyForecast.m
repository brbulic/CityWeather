//
//  PMWorldWeatherDailyForecast.m
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "PMWorldWeatherDailyForecast.h"
#import "PMWorldWeatherHourlyForecast.h"
#import <PMPracticFunction/PMPracticFunction.h>

@implementation PMWorldWeatherDailyForecast

static NSDateFormatter * _weatherParserFormatter;
+ (NSDateFormatter *)dateFormatter {
    NSString * format = @"yyyy-MM-dd";
    
    if (!_weatherParserFormatter) {
        _weatherParserFormatter = [NSDateFormatter new];
        [_weatherParserFormatter setDateFormat:format];
    }
    
    return _weatherParserFormatter;
}

- (instancetype)initFromJsonDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        // UBER api design :S
        self.date = [[[self class] dateFormatter] dateFromString:dict[@"date"]];
        
        self.hourlyWeather = [dict[@"hourly"] map:^id(NSDictionary * element) {
            return [[PMWorldWeatherHourlyForecast alloc] initFromJsonDictionary:element];
        }];
        
    }
    return self;
}

@end

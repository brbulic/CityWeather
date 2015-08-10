//
//  PMWorldWeatherDayInfo.m
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "PMWorldWeatherDayInfo.h"
#import <PMPracticFunction/PMPracticFunction.h>

@implementation PMWorldWeatherDayInfo

static NSDateFormatter * _weatherParserFormatter;
+ (NSDateFormatter *)dateFormatter {
    NSString * format = @"dd-MM-yyyy";
    
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
        self.date = [[[self class] dateFormatter] dateFromString:dict[@"date"]];
        
        NSArray * hourly = [dict[@"hourly"] map:^id(id element) {
            
        }];
        
    }
    return self;
}

@end

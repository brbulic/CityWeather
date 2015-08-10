//
//  PMWorldWeatherDailyForecast.h
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IWeatherDayInfo.h"

@interface PMWorldWeatherDailyForecast : NSObject<IWeatherDayInfo>

@property (nonatomic, strong) NSDate * date;
@property (nonatomic, strong) NSArray * hourlyWeather;

- (instancetype)initFromJsonDictionary:(NSDictionary *)dict;

@end

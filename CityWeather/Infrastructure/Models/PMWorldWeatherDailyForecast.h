//
//  PMWorldWeatherDailyForecast.h
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IWeatherDayInfo.h"
#import "PMDomainEntity.h"

@interface PMWorldWeatherDailyForecast : PMDomainEntity<IWeatherDayInfo>

@property (nonatomic, strong) NSDate * date;
@property (nonatomic, strong) NSArray * hourlyWeather;

@end

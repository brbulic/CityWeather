//
//  PMWorldWeatherHourlyForecast.h
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMDomainEntity.h"

@interface PMWorldWeatherHourlyForecast : PMDomainEntity<IWeather>

@property (nonatomic, strong) NSDate * date;
@property (nonatomic, copy) NSString * iconName;
@property (nonatomic, copy) NSString * temperatureCelsius;
@property (nonatomic, copy) NSString * forecast;

@end

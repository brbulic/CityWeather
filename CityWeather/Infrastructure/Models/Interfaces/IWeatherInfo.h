//
//  IWeatherInfo.h
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IWeather.h"
#import "IWeatherDayInfo.h"

@protocol IWeatherInfo <NSObject>

@property (nonatomic, strong) NSDate * date;
@property (nonatomic, strong) NSString * cityName;

@property (nonatomic, strong) id<IWeather> currentInfo;
@property (nonatomic, strong) NSArray * dailyForecast;

@end

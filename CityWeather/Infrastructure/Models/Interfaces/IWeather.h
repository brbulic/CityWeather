//
//  IWeather.h
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

@protocol IWeather <NSObject>

@property (nonatomic, strong) NSDate * date;
@property (nonatomic, strong) NSString * iconName;
@property (nonatomic, strong) NSString * temperatureCelsius;
@property (nonatomic, strong) NSString * forecast;
@property (nonatomic, strong) NSString * hour;

@end

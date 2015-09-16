//
// Created by Bruno Bulić on 10/08/15.
// Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "CityWeather-Swift.h"

@protocol ICityQueryObject <ICity>

- (NSString *)stringValue;

@end
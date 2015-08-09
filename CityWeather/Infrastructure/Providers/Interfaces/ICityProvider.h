//
//  ICityProvider.h
//  CityWeather
//
//  Created by Bruno Bulić on 09/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PMPromise;
@protocol ICity;

@protocol ICityProvider <NSObject>

- (PMPromise *)findCitiesByName:(NSString *)city;

- (NSArray *)getCities;
- (NSArray *)getCitiesByName:(NSString *)city;

- (id<ICity>)addCity:(id<ICity>)city;
- (BOOL)removeCity:(id<ICity>)city;

@end
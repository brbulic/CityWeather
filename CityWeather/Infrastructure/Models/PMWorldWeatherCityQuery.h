//
//  PMWorldWeatherCityQuery.h
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "ICityQueryObject.h"
#import "PMDomainEntity.h"

@interface PMWorldWeatherCityQuery : PMDomainEntity <ICityQueryObject>

@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * state;
@property (nonatomic, copy) NSString * country;

@end

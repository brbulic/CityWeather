//
//  PMWorldWeatherCityQuery.h
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICityQueryObject.h"
#import "PMDomainEntity.h"

@interface PMWorldWeatherCityQuery : PMDomainEntity <ICityQueryObject>

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * state;
@property (nonatomic, strong) NSString * country;

@end

//
//  PMCity.h
//  CityWeather
//
//  Created by Bruno Bulić on 09/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "ICity.h"

@interface PMCity : NSObject<ICity>

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * state;
@property (nonatomic, strong) NSString * country;

@end

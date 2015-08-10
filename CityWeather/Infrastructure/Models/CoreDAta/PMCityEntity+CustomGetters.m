//
//  PMCityEntity+CustomGetters.m
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "PMCityEntity+CustomGetters.h"

@implementation PMCityEntity (CustomGetters)

- (NSString *)stringValue {
    return [NSString stringWithFormat:@"%@, %@", self.name, self.country];
}

@end

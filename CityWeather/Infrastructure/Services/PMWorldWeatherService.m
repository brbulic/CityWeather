//
//  PMWorldWeatherProvider.m
//  CityWeather
//
//  Created by Bruno Bulić on 09/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "PMWorldWeatherService.h"
#import "PMWorldWeatherServiceApiProvider.h"
#import "PMPromiseBuilder.h"

@interface PMWorldWeatherService()

@property (nonatomic, strong) PMWorldWeatherServiceApiProvider * apiProvider;

@end

@implementation PMWorldWeatherService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.apiProvider = [PMWorldWeatherServiceApiProvider new];
    }
    return self;
}

- (PMPromise *)fetchWeatherForCity:(NSString *)cityName {
    __weak typeof(self) this = self;
    return [PMPromiseBuilder createNewPromise:^(PMResolvePromise success, PMRejectPromise fail) {
        [this.apiProvider fetchByCity:cityName withCallback:^(NSDictionary *responseObject, NSError *error) {
            if (error) {
                fail(error);
            } else {
                success(responseObject);
            }
        }];
    }];
}

@end



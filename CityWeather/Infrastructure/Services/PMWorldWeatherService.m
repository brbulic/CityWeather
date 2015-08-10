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
#import "PMWorldWeatherCityQuery.h"
#import "PMWorldWeatherWeatherInfo.h"
#import <PMPracticFunction/PMPracticFunction.h>

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
                PMWorldWeatherWeatherInfo * info = [[PMWorldWeatherWeatherInfo alloc] initWithDictionary:responseObject[@"data"]];
                info.cityName = cityName;
                success(info);
            }
        }];
    }];
}

- (PMPromise *)fetchCitiesForCityQuery:(NSString *)cityNameCandidate {
    __weak typeof(self) this = self;
    return [PMPromiseBuilder createNewPromise:^(PMResolvePromise success, PMRejectPromise fail) {
        [this.apiProvider searchForCity:cityNameCandidate withCallback:^(NSDictionary *responseObject, NSError *error) {
            if (error) {
                fail(error);
            } else {
                NSArray * results = [responseObject[@"search_api"][@"result"] map:^id(NSDictionary * element) {
                    return [[PMWorldWeatherCityQuery alloc] initWithDictionary:element];
                }];

                success(results);
            }
        }];
    }];
}

@end



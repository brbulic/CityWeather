//
//  PMWorldWeatherServiceApiProvider.m
//  CityWeather
//
//  Created by Bruno Bulić on 09/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "PMWorldWeatherServiceApiProvider.h"

static NSString * PMWorldWeatherApiServiceCoreUrl = @"http://api.worldweatheronline.com/";
static NSString * PMWorldWeatherApiServiceApiKey = @"e1e6a1908b516edcb10a9bb6ab0bc";


@implementation PMWorldWeatherServiceApiProvider

- (instancetype)init
{
    self = [super initWithBaseURL:[NSURL URLWithString:PMWorldWeatherApiServiceCoreUrl]];
    if (self) {
        [self setRequestSerializer:[AFJSONRequestSerializer serializer]];
        [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
    }
    return self;
}

- (void)fetchByCity:(NSString *)cityName withCallback:(PMApiResult)callback {
    NSDictionary * request = @{
                               @"q": cityName,
                               @"format": @"json",
                               @"num_of_days": @5,
                               @"key": PMWorldWeatherApiServiceApiKey
                              };
    
    [self GET:@"/free/v2/weather.ashx" parameters:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        callback(responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        callback(nil, error);
    }];
}

- (void)searchForCity:(NSString *)cityName withCallback:(PMApiResult)callback {
    NSDictionary * request = @{
                               @"q": cityName,
                               @"format": @"json",
                               @"key": PMWorldWeatherApiServiceApiKey
                             };
    [self GET:@"/free/v2/search.ashx" parameters:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        callback(responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        callback(nil, error);
    }];
}

@end

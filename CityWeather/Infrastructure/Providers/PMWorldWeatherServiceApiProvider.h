//
//  PMWorldWeatherServiceApiProvider.h
//  CityWeather
//
//  Created by Bruno Bulić on 09/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void(^PMApiResult)(NSDictionary *responseObject, NSError * error);

@interface PMWorldWeatherServiceApiProvider: AFHTTPRequestOperationManager

- (void)fetchByCity:(NSString *)cityName withCallback:(PMApiResult)callback;
- (void)searchForCity:(NSString *)cityName withCallback:(PMApiResult)callback;

@end
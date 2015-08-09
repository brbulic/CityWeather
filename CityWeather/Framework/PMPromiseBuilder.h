//
//  PMPromiseBuilder.h
//  CityWeather
//
//  Created by Bruno Bulić on 09/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PMPromise;

typedef void(^PMResolvePromise)(id object);
typedef void(^PMRejectPromise)(NSError * error);

typedef void(^PMPromiseResolver)(PMResolvePromise success, PMRejectPromise fail);

@interface PMPromiseBuilder : NSObject

+ (PMPromise *)createNewPromise:(PMPromiseResolver)resolver;

@end

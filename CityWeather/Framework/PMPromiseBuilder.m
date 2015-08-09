//
//  PMPromiseBuilder.m
//  CityWeather
//
//  Created by Bruno Bulić on 09/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "PMPromiseBuilder.h"
#import "PMPromise.h"

@interface PMPromise (PrivateMethods)

- (void)invokeOnDone:(id)object;
- (void)invokeOnError:(NSError *)object;

@end

@implementation PMPromiseBuilder

static NSMutableDictionary * referenceCounter;

+ (void)initialize {
    referenceCounter = [NSMutableDictionary new];
}

+ (PMPromise *)createNewPromise:(PMPromiseResolver)resolver {
    PMPromise * promise = [PMPromise new];
    
    PMResolvePromise success = ^(id object) {
        [promise invokeOnDone:object];
    };
    
    PMRejectPromise fail = ^(NSError * error) {
        [promise invokeOnError:error];
    };
    
    resolver(success, fail);
    return promise;
}

@end

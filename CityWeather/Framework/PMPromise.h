//
//  PMPromise.h
//  CityWeather
//
//  Created by Bruno Bulić on 09/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "PMPromiseBuilder.h"

@interface PMPromise : NSObject

@property (nonatomic, readonly, getter=onDoneInvoked) PMPromise * (^onDone)(PMResolvePromise resolve);
@property (nonatomic, readonly, getter=onErrorInvoked) PMPromise * (^onError)(PMRejectPromise reject);

- (void)cancel;

@end

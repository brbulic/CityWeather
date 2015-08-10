//
//  PMPromise.m
//  CityWeather
//
//  Created by Bruno Bulić on 09/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "PMPromise.h"

@interface PMPromise ()

@property (nonatomic, copy) PMResolvePromise onDoneInternalCallback;
@property (nonatomic, copy) PMRejectPromise onErrorInternalCallback;

@end

@implementation PMPromise {
    BOOL _cancel;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (PMPromise *(^)(PMResolvePromise))onDoneInvoked {
    __weak typeof(self) this = self;
    return ^PMPromise *(PMResolvePromise userResponse) {
        this.onDoneInternalCallback = userResponse;
        
        return this;
    };
}

- (PMPromise *(^)(PMRejectPromise))onErrorInvoked {
    __weak typeof(self) this = self;
    return ^PMPromise *(PMRejectPromise userResponse) {
        this.onErrorInternalCallback = userResponse;
        
        return this;
    };
}

- (void)cancel {
    _cancel = YES;
}

- (void)invokeOnDone:(id)object {
    if (_cancel) return;
    
    if (self.onDoneInternalCallback) {
        self.onDoneInternalCallback(object);
    }
}

- (void)invokeOnError:(NSError *)object {
    if (_cancel) return;
    
    if (self.onErrorInternalCallback) {
        self.onErrorInternalCallback(object);
    }
}

- (void)dealloc {
    NSLog(@"Cleaned!");
}

@end

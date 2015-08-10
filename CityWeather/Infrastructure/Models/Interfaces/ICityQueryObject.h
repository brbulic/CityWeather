//
// Created by Bruno Bulić on 10/08/15.
// Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "ICity.h"

@protocol ICityQueryObject <ICity>

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * state;
@property (nonatomic, strong) NSString * country;

- (NSString *)stringValue;

@end
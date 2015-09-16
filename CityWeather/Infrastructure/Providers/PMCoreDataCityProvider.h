//
// Created by Bruno Bulić on 09/08/15.
// Copyright (c) 2015 Bula doo. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "ICityProvider.h"

@interface PMCoreDataCityProvider : NSObject<ICityProvider>

- (instancetype)initWithManagedContext:(NSManagedObjectContext *)context NS_DESIGNATED_INITIALIZER;

@end
//
// Created by Bruno Bulić on 09/08/15.
// Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "PMCoreDataCityProvider.h"
#import "PMPromise.h"
#import "PMCityEntity.h"

@implementation PMCoreDataCityProvider {
    __weak NSManagedObjectContext * _context;
}

- (instancetype)initWithManagedContext:(NSManagedObjectContext *)context {
    self = [super init];
    if (self) {
        _context = context;
    }

    return self;
}

- (PMPromise *)findCitiesByName:(NSString *)city {
    return nil;
}

- (NSArray *)getCities {
    NSFetchRequest * fr = [NSFetchRequest fetchRequestWithEntityName:@"PMCityEntity"];

    return [_context executeFetchRequest:fr error:nil];
}

- (NSArray *)getCitiesByName:(NSString *)cityName {
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"ANY name CONTAINS[c] %@", cityName];

    NSFetchRequest * fr = [NSFetchRequest fetchRequestWithEntityName:@"PMCityEntity"];
    [fr setPredicate:predicate];

    return [_context executeFetchRequest:fr error:nil];
}

- (id<ICity>)findCityByQuery:(id<ICity>)city {
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"name=%@ AND state=%@ AND country=%@", [city name], [city state], [city country]];
    
    NSFetchRequest * fr = [NSFetchRequest fetchRequestWithEntityName:@"PMCityEntity"];
    [fr setPredicate:predicate];
    return [[_context executeFetchRequest:fr error:nil] firstObject];
}

- (id <ICity>)addCity:(id <ICity>)city {
    PMCityEntity * entity = [NSEntityDescription insertNewObjectForEntityForName:@"PMCityEntity" inManagedObjectContext:_context];

    entity.name = [city name];
    entity.state = [city state];
    entity.country = [city country];

    [_context save:nil];

    return entity;
}

- (BOOL)removeCity:(id <ICity>)city {
    if ([city isKindOfClass:[NSManagedObject class]]) {
        [_context deleteObject:(id)city];
        return [_context save:nil];
    }

    return false;
}

@end
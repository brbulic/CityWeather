//
//  PMCityEntity.h
//  
//
//  Created by Bruno Bulić on 09/08/15.
//
//

#import <CoreData/CoreData.h>
#import "CityWeather-Swift.h"

@class PMWeatherEntity;

@interface PMCityEntity : NSManagedObject<ICity>

@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * state;
@property (nonatomic, copy) NSString * country;

@end
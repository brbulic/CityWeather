//
//  PMWeatherEntity.h
//  
//
//  Created by Bruno Bulić on 09/08/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PMCityEntity;

@interface PMWeatherEntity : NSManagedObject

@property (nonatomic, retain) NSNumber * tempK;
@property (nonatomic, retain) NSString * icon;
@property (nonatomic, retain) NSNumber * windKnots;
@property (nonatomic, retain) NSString * forecast;
@property (nonatomic, retain) NSNumber * pressure;
@property (nonatomic, retain) PMCityEntity *fk_City;

@end

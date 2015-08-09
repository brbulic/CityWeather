//
//  PMCityEntity.h
//  
//
//  Created by Bruno Bulić on 09/08/15.
//
//

#import <CoreData/CoreData.h>
#import "ICity.h"

@class PMWeatherEntity;

@interface PMCityEntity : NSManagedObject<ICity>

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSSet *fk_Weather;
@end

@interface PMCityEntity (CoreDataGeneratedAccessors)

- (void)addFk_WeatherObject:(PMWeatherEntity *)value;
- (void)removeFk_WeatherObject:(PMWeatherEntity *)value;
- (void)addFk_Weather:(NSSet *)values;
- (void)removeFk_Weather:(NSSet *)values;

@end

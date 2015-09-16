//
//  PMCityForecastTableViewCell.h
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IWeatherDayInfo.h"

@interface PMCityForecastTableViewCell : UITableViewCell

- (void)configureWithCity:(id<ICity>)city andForecast:(id<IWeatherDayInfo>)info;

@end

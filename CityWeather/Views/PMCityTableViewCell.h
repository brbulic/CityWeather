//
//  PMCityTableViewCell.h
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PMPromise;
@protocol ICity;

@interface PMCityTableViewCell : UITableViewCell

- (void)setCity:(id<ICity>)city withPromise:(PMPromise *)weather;

@end

//
//  DetailViewController.h
//  CityWeather
//
//  Created by Bruno Bulić on 09/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ICity;

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id<ICity> detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end


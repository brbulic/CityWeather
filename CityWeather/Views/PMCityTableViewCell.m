//
//  PMCityTableViewCell.m
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "PMCityTableViewCell.h"
#import "PMPromise.h"
#import "IWeatherInfo.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface PMCityTableViewCell()

@property (nonatomic, strong) id<ICity> city;

@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageLabel;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;

@end

@implementation PMCityTableViewCell

static NSDateFormatter * _formatter;
+ (NSDateFormatter *)dateFormatter {
    if (!_formatter) {
        _formatter = [NSDateFormatter new];
        [_formatter setDateFormat:@"dd/MM/YYYY"];
    }
    
    return _formatter;
}

- (void)awakeFromNib {
    self.dateLabel.text = [[[self class] dateFormatter] stringFromDate:[NSDate date]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)prepareForReuse {
    [super prepareForReuse];
}

- (void)setCity:(id<ICity>)city withPromise:(PMPromise *)weather {
    
    if (self.city == city) {
        return;
    }
    
    self.city = city;
    
    self.cityLabel.text = [NSString stringWithFormat:@"%@, %@", [city name], [city country]];
    
    [self.cityLabel setHidden:NO];
    [self.dateLabel setHidden:NO];
    
    __weak typeof(self) this = self;
    [self.loading startAnimating];
    weather.onDone(^(id<IWeatherInfo> weatherData) {

        this.tempLabel.text = weatherData.currentInfo.forecast;
        [this.imageLabel setImageWithURL:[NSURL URLWithString:weatherData.currentInfo.iconName]];
        
        [this.tempLabel setHidden:NO];
        [this.imageLabel setHidden:NO];
        
        [self.loading stopAnimating];
    });
}

@end

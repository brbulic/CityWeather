//
//  PMCityForecastTableViewCell.m
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "PMCityForecastTableViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface PMCityForecastTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UILabel *dayOfWeek;
@property (weak, nonatomic) IBOutlet UILabel *date;

@property (weak, nonatomic) IBOutlet UIImageView *morningImage;
@property (weak, nonatomic) IBOutlet UIImageView *noonImage;
@property (weak, nonatomic) IBOutlet UIImageView *eveningAfternoonImage;
@property (weak, nonatomic) IBOutlet UIImageView *eveningImage;

@property (weak, nonatomic) IBOutlet UILabel *morningTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *noonTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *afternoonTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *eveningTempLabel;

@end

@implementation PMCityForecastTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

static NSDateFormatter * _formatter;
static NSDateFormatter * _dayOfWeek;
+ (NSDateFormatter *)dateFormatter {
    if (!_formatter) {
        _formatter = [NSDateFormatter new];
        [_formatter setDateFormat:@"dd/MM/YYYY"];
    }
    
    return _formatter;
}

+ (NSDateFormatter *)dayOfWeekFormatter {
    if (!_dayOfWeek) {
        _dayOfWeek = [NSDateFormatter new];
        [_dayOfWeek setDateFormat:@"EEEE"];
    }
    
    return _dayOfWeek;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configureWithCity:(id<ICity>)city andForecast:(id<IWeatherDayInfo>)info {
    self.date.text = [[[self class] dateFormatter] stringFromDate:info.date];
    self.dayOfWeek.text = [[[self class] dayOfWeekFormatter] stringFromDate:info.date];
    
    id<IWeather> morning = [info hourlyWeather][0];
    id<IWeather> noon = [info hourlyWeather][1];
    id<IWeather> afternoon = [info hourlyWeather][2];
    id<IWeather> evening = [info hourlyWeather][3];
    
    self.morningTempLabel.text = [self formatTemp:[morning temperatureCelsius]];
    self.noonTempLabel.text = [self formatTemp:[noon temperatureCelsius]];
    self.afternoonTempLabel.text = [self formatTemp:[afternoon temperatureCelsius]];
    self.eveningTempLabel.text = [self formatTemp:[evening temperatureCelsius]];
    
    [self.morningImage setImageWithURL:[NSURL URLWithString:morning.iconName]];
    [self.noonImage setImageWithURL:[NSURL URLWithString:noon.iconName]];
    [self.eveningAfternoonImage setImageWithURL:[NSURL URLWithString:afternoon.iconName]];
    [self.eveningImage setImageWithURL:[NSURL URLWithString:evening.iconName]];

}

- (NSString *)formatTemp:(NSString *)date {
    return [date stringByAppendingString:@"°C"];
}

@end

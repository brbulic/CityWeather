//
//  DetailViewController.m
//  CityWeather
//
//  Created by Bruno Bulić on 09/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "DetailViewController.h"
#import "PMWorldWeatherService.h"
#import "IWeatherInfo.h"
#import "PMCityForecastTableViewCell.h"

@interface DetailViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) id<IWeatherService> weatherService;
@property (nonatomic, strong) NSArray * dailyForecast;

@end

@implementation DetailViewController

static NSString * PMForecastDetailViewCellIdentifier = @"ForecastCell";

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.weatherService = [PMWorldWeatherService new];
    }
    return self;
}

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    if (self.detailItem) {
        NSString * cityName = [NSString stringWithFormat:@"%@, %@, %@", [self.detailItem name], [self.detailItem state], [self.detailItem country]];
        [self.weatherService fetchWeatherForCity:cityName].onDone(^(id<IWeatherInfo> weatherInfo) {
            self.dailyForecast = [weatherInfo dailyForecast];
            [self.tableView reloadData];
        }).onError(^(NSError * error) {
            NSLog(@"Cannot display :(");
        });
        self.title = [self.detailItem name];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dailyForecast.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PMCityForecastTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:PMForecastDetailViewCellIdentifier];
    
    if (!cell) {
        cell = [[PMCityForecastTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:PMForecastDetailViewCellIdentifier];
    }
    
    id<IWeatherDayInfo> info = self.dailyForecast[indexPath.row];
    
    [cell configureWithCity:_detailItem andForecast:info];
    
    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PMCityForecastTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:PMForecastDetailViewCellIdentifier];

}

@end

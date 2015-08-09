//
//  PMAddCityViewController.m
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "PMAddCityViewController.h"
#import "IWeatherService.h"
#import "PMWorldWeatherService.h"

@interface PMAddCityViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *addCityTextField;
@property (nonatomic, strong) NSArray * potentialCities;
@property (nonatomic, strong) id<IWeatherService> weatherService;

@end

@implementation PMAddCityViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.weatherService = [PMWorldWeatherService new];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.potentialCities = [NSArray array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end

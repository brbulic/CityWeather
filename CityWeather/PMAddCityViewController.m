//
//  PMAddCityViewController.m
//  CityWeather
//
//  Created by Bruno Bulić on 10/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "PMAddCityViewController.h"
#import "IWeatherService.h"
#import "ICityProvider.h"
#import "ICityQueryObject.h"

#import "PMWorldWeatherService.h"
#import "PMCoreDataCityProvider.h"

@interface PMAddCityViewController ()<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, strong) id<IWeatherService> weatherService;
@property (nonatomic, strong) id<ICityProvider> cityProvider;

@property (nonatomic, strong) NSArray * potentialCities;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) PMPromise * currentPromise;

@end

@implementation PMAddCityViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.weatherService = [PMWorldWeatherService new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.potentialCities = [NSArray array];
}

- (void)setManagedContext:(NSManagedObjectContext *)context {
    self.cityProvider = [[PMCoreDataCityProvider alloc] initWithManagedContext:context];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cities"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cities"];
    }
    
    id<ICityQueryObject> object = self.potentialCities[indexPath.row];
    cell.textLabel.text = [object stringValue];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.potentialCities.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id<ICity> city = self.potentialCities[indexPath.row];
    
    if (![self.cityProvider findCityByQuery:city]) {
        [self.cityProvider addCity:city];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSString * query = searchBar.text;
    if (!query || query.length == 0) {
        [self clear];
        return;
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString * query = searchBar.text;
    
    if (self.currentPromise) {
        [self.currentPromise cancel];
    }
    
    if (!query || query.length == 0) {
        [self clear];
        return;
    }
    
    __weak typeof(self) this = self;
    self.currentPromise = [self.weatherService fetchCitiesForCityQuery:query].onDone(^(NSArray * cities){
        this.potentialCities = cities;
        [this.tableView reloadData];
    });
}

- (void)clear {
    self.potentialCities = [NSArray array];
    [self.tableView reloadData];
}
    
@end
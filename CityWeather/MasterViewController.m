//
//  MasterViewController.m
//  CityWeather
//
//  Created by Bruno Bulić on 09/08/15.
//  Copyright (c) 2015 Bula doo. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "IWeatherService.h"
#import "PMWorldWeatherService.h"
#import "ICityProvider.h"
#import "PMCity.h"
#import "PMCoreDataCityProvider.h"
#import "PMCityTableViewCell.h"
#import "PMAddCityViewController.h"

@interface MasterViewController ()

@property (nonatomic, strong) id<IWeatherService> weatherProvider;
@property (nonatomic, strong) NSArray * cities;
@property (nonatomic, strong) NSDictionary * weatherInfo;

@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.weatherProvider = [PMWorldWeatherService new];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PMCityTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CityCell"];
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self reloadData];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        id<ICity> city = self.cities[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:city];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
    
    if ([[segue identifier] isEqualToString:@"addCity"]) {
        PMAddCityViewController * addCityVc = (PMAddCityViewController *)[segue destinationViewController];
        [addCityVc setManagedContext:self.managedObjectContext];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

- (void)reloadData {
    self.cities = [self.cityProvider getCities];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        id<ICity> city = self.cities[indexPath.row];
        [self.cityProvider removeCity:city];
        [self reloadData];
    }
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    PMCityTableViewCell * cityCell = (PMCityTableViewCell *)cell;
    
    id<ICity> city = self.cities[indexPath.row];
    [cityCell setCity:city withPromise:[self.weatherProvider fetchWeatherForCity:[city name]]];
}

- (id <ICityProvider>)cityProvider {
    if (!_cityProvider) {
        _cityProvider = [[PMCoreDataCityProvider alloc] initWithManagedContext:self.managedObjectContext];
    }

    return _cityProvider;
}

@end

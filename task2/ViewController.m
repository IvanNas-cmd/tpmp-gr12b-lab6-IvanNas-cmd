//
//  ViewController.m
//  Task2 – Weather & Museum (Variant 17)
//  Author: Ivan Nasennik, Group 12b
//
//  Variant 17: show famous museum image and name for selected city.
//  Cities: Tbilisi & Batumi (Georgia), Paris & Lyon (France).
//  Localization: English, Russian, Belarusian.
//

#import "ViewController.h"

// MARK: - Private Interface

@interface ViewController ()

/// Ordered list of city keys (used as localization keys too)
@property (nonatomic, strong) NSArray<NSString *> *cities;

/// Temperature data and museum info keyed by city name
@property (nonatomic, strong) NSDictionary<NSString *, NSDictionary *> *cityData;

@end

// MARK: - Implementation

@implementation ViewController

// MARK: Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupData];
    [self setupSegmentedControl];
    [self updateUIForCityAtIndex:0];
}

// MARK: Setup

- (void)setupData {
    // TODO: replace placeholder image names with actual assets added to xcassets
    self.cities = @[@"Tbilisi", @"Batumi", @"Paris", @"Lyon"];

    self.cityData = @{
        @"Tbilisi" : @{
            @"temp"    : @25,
            @"museum"  : @"museum_tbilisi_name",
            @"image"   : @"museum_tbilisi"
        },
        @"Batumi" : @{
            @"temp"    : @22,
            @"museum"  : @"museum_batumi_name",
            @"image"   : @"museum_batumi"
        },
        @"Paris" : @{
            @"temp"    : @15,
            @"museum"  : @"museum_paris_name",
            @"image"   : @"museum_paris"
        },
        @"Lyon" : @{
            @"temp"    : @18,
            @"museum"  : @"museum_lyon_name",
            @"image"   : @"museum_lyon"
        }
    };
}

- (void)setupSegmentedControl {
    [self.citySegmentedControl removeAllSegments];
    for (NSUInteger i = 0; i < self.cities.count; i++) {
        NSString *localizedCity = NSLocalizedString(self.cities[i], nil);
        [self.citySegmentedControl insertSegmentWithTitle:localizedCity
                                                  atIndex:i
                                                animated:NO];
    }
    self.citySegmentedControl.selectedSegmentIndex = 0;
}

// MARK: UI Update

/// Updates all UI elements for the city at the given index.
- (void)updateUIForCityAtIndex:(NSInteger)index {
    NSString *cityKey    = self.cities[index];
    NSDictionary *data   = self.cityData[cityKey];
    NSNumber *temp       = data[@"temp"];
    NSString *museumKey  = data[@"museum"];
    NSString *imageName  = data[@"image"];

    NSString *localizedCity   = NSLocalizedString(cityKey, nil);
    NSString *localizedMuseum = NSLocalizedString(museumKey, nil);

    // MARK: Temperature label
    NSString *tempText = [NSString stringWithFormat:@"%@: %@°C", localizedCity, temp];
    self.temperatureLabel.text = tempText;

    // Color depends on temperature
    if (temp.integerValue > 20) {
        self.temperatureLabel.textColor = [UIColor systemRedColor];
    } else {
        self.temperatureLabel.textColor = [UIColor systemBlueColor];
    }

    // MARK: Museum label
    self.museumNameLabel.text = localizedMuseum;

    // MARK: Museum image
    // FIXME: add real museum images to xcassets with the names listed in setupData
    UIImage *museumImage = [UIImage imageNamed:imageName];
    self.museumImageView.image = museumImage
        ?: [UIImage systemImageNamed:@"photo"];
}

// MARK: Actions

- (IBAction)cityChanged:(id)sender {
    NSInteger index = self.citySegmentedControl.selectedSegmentIndex;
    [self updateUIForCityAtIndex:index];
}

- (IBAction)refreshTapped:(id)sender {
    NSInteger current = self.citySegmentedControl.selectedSegmentIndex;
    NSInteger next    = (current + 1) % self.cities.count;
    self.citySegmentedControl.selectedSegmentIndex = next;
    [self updateUIForCityAtIndex:next];
}

@end

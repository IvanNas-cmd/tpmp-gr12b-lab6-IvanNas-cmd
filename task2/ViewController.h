//
//  ViewController.h
//  Task2 – Weather & Museum (Variant 17)
//  Author: Ivan Nasennik, Group 12b
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// MARK: - ViewController Interface

@interface ViewController : UIViewController

// MARK: Outlets

/// Label that shows the city name and temperature
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

/// Label that shows the museum name
@property (weak, nonatomic) IBOutlet UILabel *museumNameLabel;

/// ImageView that shows a photo of the museum
@property (weak, nonatomic) IBOutlet UIImageView *museumImageView;

/// Segmented control to pick a city
@property (weak, nonatomic) IBOutlet UISegmentedControl *citySegmentedControl;

// MARK: Actions

/// Called when the user taps the Refresh button
- (IBAction)refreshTapped:(id)sender;

/// Called when the user changes the selected city
- (IBAction)cityChanged:(id)sender;

@end

NS_ASSUME_NONNULL_END

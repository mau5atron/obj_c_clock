//
//  ViewController.h
//  007_digital_clock_app
//
//  Created by Gabriel Betancourt on 8/12/20.
//  Copyright © 2020 mau5atron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
	NSTimer *timer;
}

@property (weak, nonatomic) IBOutlet UILabel *mainLabelOutlet;
@property (weak, nonatomic) IBOutlet UIView *settingsView;
@property (weak, nonatomic) IBOutlet UIButton *settingsButton;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
// segments inside settings view
@property (weak, nonatomic) IBOutlet UISegmentedControl *settingsClockColor;
@property (weak, nonatomic) IBOutlet UISegmentedControl *settingsBackgroundColor;
@property (weak, nonatomic) IBOutlet UISegmentedControl *settingsBackgroundImage;


- (void)updateTimer;
- (IBAction)showSettings:(id)sender;
- (IBAction)settingsClockColorAction:(id)sender;
- (IBAction)settingsBackgroundColorAction:(id)sender;
- (IBAction)settingsBackgroundImageAction:(id)sender;
- (void)setBackgroundImageStr:(NSString *)imageUrlStr;
- (void)setBackgroundOutletColor:(UIColor *)outletBackgroundColor;
@end


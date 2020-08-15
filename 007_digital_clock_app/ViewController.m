//
//  ViewController.m
//  007_digital_clock_app
//
//  Created by Gabriel Betancourt on 8/12/20.
//  Copyright © 2020 mau5atron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self updateTimer];
	timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:NULL repeats:true];
	self.settingsView.hidden = true;
	
	self.settingsView.layer.cornerRadius = 5;
	self.settingsButton.layer.cornerRadius = 5;
	self.settingsBackgroundImage.selectedSegmentIndex = 4; // no image choice
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)updateTimer {
	NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
	[timeFormat setDateFormat:@"HH:mm:ss a"];
	self.mainLabelOutlet.text = [timeFormat stringFromDate:[NSDate date]];
}

- (IBAction)showSettings:(id)sender {
	self.settingsView.hidden = self.settingsView.hidden ? false : true;
	[_settingsButton setTitle:self.settingsView.hidden ? @"Show Settings" : @"Hide Settings" forState:UIControlStateNormal];
}

- (IBAction)settingsClockColorAction:(id)sender {
	switch (self.settingsClockColor.selectedSegmentIndex) {
		case 0:
			self.mainLabelOutlet.textColor = [UIColor whiteColor];
			break;
		case 1:
			self.mainLabelOutlet.textColor = [UIColor blackColor];
			break;
		case 2:
			self.mainLabelOutlet.textColor = [UIColor greenColor];
			break;
		case 3:
			self.mainLabelOutlet.textColor = [UIColor redColor];
			break;
		default:
			self.mainLabelOutlet.textColor = [UIColor whiteColor];
			break;
	}
}

- (IBAction)settingsBackgroundColorAction:(id)sender {
	self.settingsBackgroundImage.selectedSegmentIndex = 4; // no image choice
	self.backgroundImage.image = [UIImage imageNamed:@""]; // empty string to de-select image
	switch (self.settingsBackgroundColor.selectedSegmentIndex) {
		case 0:
			[self setBackgroundOutletColor:[UIColor blackColor]];
			break;
		case 1:
			[self setBackgroundOutletColor:[UIColor whiteColor]];
			break;
		case 2:
			[self setBackgroundOutletColor:[UIColor yellowColor]];
			break;
		case 3:
			[self setBackgroundOutletColor:[UIColor blueColor]];
			break;
		default:
			[self setBackgroundOutletColor:[UIColor blackColor]];
			break;
	}
}


- (IBAction)settingsBackgroundImageAction:(id)sender {
	self.backgroundImage.image = [UIImage imageNamed:@"Background1"];
	self.mainLabelOutlet.backgroundColor = [UIColor clearColor];
	switch (self.settingsBackgroundImage.selectedSegmentIndex) {
		case 0:
			[self setBackgroundImageStr:@"Background1"];
			break;
		case 1:
			[self setBackgroundImageStr:@"Background2"];
			break;
		case 2:
			[self setBackgroundImageStr:@"Background3"];
			break;
		case 3:
			[self setBackgroundImageStr:@"Background4"];
			break;
		case 4:
			[self setBackgroundImageStr:@""];
			break;
		default:
			NSLog(@"Something went wrong?");
			break;
	}
}

- (void)setBackgroundImageStr:(NSString *)imageUrlStr {
	self.backgroundImage.image = [UIImage imageNamed:imageUrlStr];
}

- (void)setBackgroundOutletColor:(UIColor *)outletBackgroundColor {
	self.backgroundImage.backgroundColor = outletBackgroundColor;
	self.mainLabelOutlet.backgroundColor = outletBackgroundColor;
}

@end

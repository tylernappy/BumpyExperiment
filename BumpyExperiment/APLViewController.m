//
//  APLViewController.m
//  BumpyExperiment
//
//  Created by Tyler Nappy on 1/13/14.
//  Copyright (c) 2014 Tyler Nappy. All rights reserved.
//

#import "APLViewController.h"
#import "APLBarGraphView.h"
#import "APLAccelerometer.h"
#import <CoreMotion/CoreMotion.h>
#import <Accelerate/Accelerate.h>
#import "APLAppDelegate.h"

@interface APLViewController ()

@property (strong, nonatomic) APLAccelerometer* accel;
@property (assign, nonatomic) BOOL accelRunning;
@property (assign, nonatomic) BOOL FFTRunning;
@property (weak, nonatomic) IBOutlet APLBarGraphView *bars;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) NSArray* result;

@end

@implementation APLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.buttonBeginCollection = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.buttonBeginCollection.frame = CGRectMake(50, 380, 200, 44);
    [self.buttonBeginCollection setTitle:@"Begin Taking Data" forState:UIControlStateNormal];
    [self.buttonBeginCollection addTarget:self action:@selector(beginCollectionButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:self.buttonBeginCollection aboveSubview:self.bars];
    
    
}

- (void) beginCollectionButtonPressed:(UIButton *) sender
{
    if ([sender isEqual:self.buttonBeginCollection]) {
        if (!_accelRunning) {
            //begin collection
            [_accel start];
            _accelRunning = YES;
            [self.buttonBeginCollection setTitle:@"Stop" forState:UIControlStateNormal];
            _statusIndicator.text = @"Collecting...";
            //_accelerationStatusIndicatorX = [NSString stringWithFormat:@"%d", ];
        } else {
            [_accel stop];
            _accelRunning = NO;
            [self.buttonBeginCollection setTitle:@"Begin Taking Data" forState:UIControlStateNormal];
            //NSUInteger *arraySize = [_accel.accelerationArray count];
            NSString *arraySize = [NSString stringWithFormat:@"%d", [_accel.accelerationArrayX count]];
            _statusIndicator.text = arraySize;
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

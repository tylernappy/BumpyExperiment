//
//  APLViewController.h
//  BumpyExperiment
//
//  Created by Tyler Nappy on 1/13/14.
//  Copyright (c) 2014 Tyler Nappy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APLAccelerometer.h"
#import "APLBarGraphView.h"

@interface APLViewController : UIViewController

- (IBAction)beginCollectionButtonPressed:(id)sender;
@property (weak, nonatomic) UIButton *buttonBeginCollection;

@property (strong, nonatomic) IBOutlet UILabel *acceleration;

@property (strong, nonatomic) IBOutlet UILabel *statusIndicator;


@property (strong, nonatomic) IBOutlet UILabel *accelerationStatusIndicatorX;
@property (strong, nonatomic) IBOutlet UILabel *accelerationStatusIndicatorY;
@property (strong, nonatomic) IBOutlet UILabel *accelerationStatusIndicatorZ;
@property (strong, nonatomic) IBOutlet UILabel *GPSStatusIndicator;
@property (strong, nonatomic) IBOutlet UILabel *timeStatusIndicator;





@end

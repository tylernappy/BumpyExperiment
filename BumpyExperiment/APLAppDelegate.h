//
//  APLAppDelegate.h
//  BumpyExperiment
//
//  Created by Tyler Nappy on 1/13/14.
//  Copyright (c) 2014 Tyler Nappy. All rights reserved.
//

#import <UIKit/UIKit.h>


@class APLAccelerometer;

@interface APLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) APLAccelerometer* accel;

@end

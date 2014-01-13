//
//  APLAccelerometer.h
//  BumpyExperiment
//
//  Created by Tyler Nappy on 1/13/14.
//  Copyright (c) 2014 Tyler Nappy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APLAccelerometer : NSObject

@property (assign, nonatomic) BOOL enabled;
@property (strong, nonatomic) NSMutableArray* accelerationArrayX;
@property (strong, nonatomic) NSMutableArray* accelerationArrayY;
@property (strong, nonatomic) NSMutableArray* accelerationArrayZ;
@property (strong, nonatomic) NSMutableArray* bumpyArray;
@property (strong, nonatomic) NSMutableArray* timeArray;
@property (strong, nonatomic) NSMutableArray* GPSCoordinatesArray;

- (void) start;
- (void) stop;
- (void) emptyArray;
//- (void) addValuesToArrays;
//- (void) locationManager;

@end

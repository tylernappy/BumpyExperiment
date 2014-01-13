//
//  APLAccelerometer.m
//  BumpyExperiment
//
//  Created by Tyler Nappy on 1/13/14.
//  Copyright (c) 2014 Tyler Nappy. All rights reserved.
//

#import "APLAccelerometer.h"
#import <CoreMotion/CoreMotion.h>
#import <CoreLocation/CoreLocation.h>

float interval = 0.05;
int fftSampleSize = 256;

@interface APLAccelerometer()

@property (strong, nonatomic) CMMotionManager* motionManager;
//@property (strong, nonatomic) CLLocationManager* locationManager;
@property (strong, nonatomic) NSOperationQueue* queue;
@property (strong, nonatomic) NSNotificationCenter* notifcations;
@property (strong, nonatomic) NSUserDefaults* defaults;

@end

@implementation APLAccelerometer

- (id)init {
    _motionManager = [[CMMotionManager alloc] init];
    //_locationManager = [[CLLocationManager init] alloc];
    _queue = [[NSOperationQueue alloc] init];
    
    //float interval = 0.05; //interval for acceleration updates
    
    _enabled = YES;
    
    _accelerationArrayX = [[NSMutableArray alloc] init];
    _accelerationArrayY = [[NSMutableArray alloc] init];
    _accelerationArrayZ = [[NSMutableArray alloc] init];
    _timeArray = [[NSMutableArray alloc] init];
    _bumpyArray = [[NSMutableArray alloc] init];
    _GPSCoordinatesArray = [[NSMutableArray alloc] init];
    
    //setup GPS Coordinates
    //_locationManager.delegate = self;
    //_locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    
    // Set a movement threshold for new events.
    //_locationManager.distanceFilter = kCLDistanceFilterNone; // meters
    
    //[_locationManager startUpdatingLocation];
    
    
    
    
    return self;
}

- (void) start {
    _motionManager.accelerometerUpdateInterval = interval;
    [_motionManager startAccelerometerUpdatesToQueue:_queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        [self addValuesToArrays:accelerometerData.acceleration];
        //[self locationManager];
        
    }];
    //[self locationManager:_locationManager];
    
}

- (void) stop {
    
}

- (void) addValuesToArrays:(CMAcceleration)acceleration
{
    //convert number from double to NSNumber
    NSNumber* numX = [NSNumber numberWithDouble:acceleration.x];
    NSNumber* numY = [NSNumber numberWithDouble:acceleration.y];
    NSNumber* numZ = [NSNumber numberWithDouble:acceleration.z];
    //NSNumber* time = [NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]];
    
    //add accelerations to arrays
    [_accelerationArrayX addObject:numX];
    [_accelerationArrayY addObject:numY];
    [_accelerationArrayZ addObject:numZ];
    
    //add time to array
    //[_timeArray addObject:time];
    
    //add GPS to array
    //[_GPSCoordinatesArray addObject:location];
    
    
    
//    NSLog(@"X: %0.2f ; Y: %0.2f ; Z: %0.2f ; [%d] ", acceleration.x, acceleration.y, acceleration.z, _accelerationArrayX.count);
    NSLog(@"Accel Data: %0.2f [%d]", acceleration.z, _accelerationArrayZ.count);
}

//- (void)locationManager:(CLLocationManager *)manager
//     didUpdateLocations:(NSArray *)locations {
//    // If it's a relatively recent event, turn off updates to save power.
//    CLLocation* location = [locations lastObject];
//    NSDate* eventDate = location.timestamp;
//    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
//    if (abs(howRecent) < 15.0) {
//        // If the event is recent, do something with it.
//        NSLog(@"latitude %+.6f, longitude %+.6f\n",
//              location.coordinate.latitude,
//              location.coordinate.longitude);
//    }
//}

- (void) emptyArray {
    
}



@end
